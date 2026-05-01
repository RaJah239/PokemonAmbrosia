# Bill's PC Hardening Plan

## Goal

Reduce the chance that Bill's PC:

- freezes when box metadata is inconsistent
- propagates pre-existing save corruption into duplicate or missing Pokemon
- turns a recoverable storage inconsistency into a hard lock

This plan is intentionally conservative. It focuses on validation and recovery
before attempting to redesign the existing storage mutation flow.

## Context

The storage system uses:

- active gameplay box metadata
- backup/saved box metadata
- indirect pointers into the two pokedb banks

This means storage integrity depends on metadata being valid and synchronized.

Relevant documentation:

- [docs/newbox_format.md](C:/cygwin64/home/Andrew/PokemonTrueCrystal/docs/newbox_format.md)
- [docs/bugs_and_glitches.md](C:/cygwin64/home/Andrew/PokemonTrueCrystal/docs/bugs_and_glitches.md)

Relevant code:

- [engine/pc/bills_pc.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/pc/bills_pc.asm)
- [engine/menus/save.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/menus/save.asm)

## What The NewBox Documentation Implies

`newbox_format.md` explicitly states:

- gameplay metadata lives at `0x2D10-0x2F20`
- saved metadata lives at `0x2F20-0x3130`
- if saving was interrupted, the newer box state might be in the gameplay copy
  instead of the saved copy

It also states that pokedb data must always be referenced indirectly through the
metadata, because unreferenced pokedb entries may contain garbage.

This strongly suggests that interrupted saves can leave storage metadata in a
partially updated but still loadable state, and that later Bill's PC actions may
be where the damage becomes visible.

## Current Risk Areas

### 1. Mutation paths are not atomic

Party-to-box and box-to-party swaps in `SwapStorageBoxSlots` update storage in
multiple steps:

1. allocate a new pokedb entry
2. write the new box pointer
3. write the previous pointer back to party

If execution is interrupted in the middle, the system can temporarily contain
duplicate references or lose the old reference.

`UpdateStorageBoxMonFromTemp` also clears the old pointer before installing the
replacement pointer. That creates another interruption window.

Concrete high-risk routines:

- `SwapStorageBoxSlots`
- `UpdateStorageBoxMonFromTemp`

### 2. Allocation trusts used-entry flags

`NewStoragePointer` searches the used-entry bitmap first. It only rebuilds that
bitmap with `FlushStorageSystem` if no free entry is found.

If the bitmap is stale-low while metadata still references an entry, the
allocator can reuse an already referenced pokedb slot.

This should be thought of as a corruption propagation risk rather than proof
that a clean save can spontaneously duplicate Pokemon.

### 3. Some integrity failures hard-freeze

Two routines currently treat integrity violations as fatal:

- `GetStorageBoxPointer`
- `AddStorageMon`

Both use deliberate infinite loops rather than returning an error.

This is acceptable for development assertions, but it is poor failure behavior
for end users with partially corrupted storage metadata.

### 4. Runtime metadata sanitation is limited

`InitializeBoxes` performs limited validation for backup box entries during
initial setup, but normal Bill's PC use trusts active metadata much more than
would be ideal.

The mon payload checksum protects against invalid mon data, but it does not
repair invalid metadata pointers.

### 5. Recovery semantics depend on which storage copy is newer

Regular play mutates the active storage metadata directly in SRAM. The backup
copy is only synchronized during saving.

Load behavior then works as follows:

- if the main save is valid, the game can finish an interrupted save by writing
  backup data before loading storage
- `LoadStorageSystem` then copies backup storage into active storage

This means interrupted saves are especially sensitive to which copy was newest
when the interruption happened.

## Additional Investigation Notes

### Bill's PC entry point

The clean hook for a first-pass repair step is `UseBillsPC`.

That lets us sanitize metadata and rebuild allocation flags once before the UI
starts performing any storage operation.

### Silent-map crash does not currently look like a storage bug

There is a separate crash report where opening Bill's PC on a map with no
currently playing map music can crash.

Current code reading does not suggest that this is directly caused by the box
storage logic:

- `BillsPC` in
  [engine/events/pokecenter_pc.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/events/pokecenter_pc.asm)
  does not call `PlayMapMusic` or `RestartMapMusic`
- Bill's PC UI code does not read `wMapMusic`
- generic audio helpers already treat `MUSIC_NONE` as a valid state

What Bill's PC *does* do on entry is:

1. play the choose-PC SFX
2. display the Bill's PC text
3. enter the custom Bill's PC UI
4. switch the CGB into double-speed mode
5. install custom LCD interrupt behavior for the UI

Relevant entry points:

- `BillsPC`, `PC_PlayChoosePCSound`, and `PC_WaitPlaySFX` in
  [engine/events/pokecenter_pc.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/events/pokecenter_pc.asm)
- `_BillsPC` and `UseBillsPC` in
  [engine/pc/bills_pc_ui.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/pc/bills_pc_ui.asm)
- `PlayMusic`, `PlaySFX`, `PlayMapMusic`, and `RestartMapMusic` in
  [home/audio.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/home/audio.asm)

This makes the silent-map crash look more like an entry sequencing or
timing-sensitive audio/UI interaction than a metadata corruption issue.

In particular, Bill's PC is unusual because it is the only PC path here that
switches to CGB double-speed and uses custom LCD handling. If the map is
silent, the only active audio state at entry may be the PC/text SFX itself.
That may expose a race or initialization assumption that is masked when normal
background music is already active.

This should be investigated as a separate hardening track from storage
integrity. A good first experiment is:

- wait for SFX completion immediately before entering `_BillsPC`, or
- wait for SFX completion immediately before `DoubleSpeed` in `UseBillsPC`

If that removes the crash, the failure is likely tied to Bill's PC entering its
custom CGB mode while audio state is still transitioning, rather than to box
metadata itself.

### Box metadata operations are lower risk than boxed-mon rewrites

The following actions mainly touch box metadata and are not the first targets
for hardening:

- box rename
- box theme

The more sensitive operations are:

- deposit and withdraw
- release
- item and mail movement
- any boxed-mon edit that commits through `UpdateStorageBoxMonFromTemp`

### `UpdateStorageBoxMonFromTemp` is a shared commit path

This helper is not only used by Bill's PC. Other boxed-mon systems also route
through it.

That is good for hardening value, but it also means any behavior change there
must be reviewed very carefully.

### Player gender save changes appear separate

`wPlayerGender` lives in `wCrystalData` and is saved to `sCrystalData`, which is
outside both the main checked save block and the newbox metadata region.

So player-gender persistence is not currently considered a direct cause of Bill's
PC duplication or deletion reports. At most, it can make the overall save path
slightly longer.

## Proposed Hardening Changes

### Phase 1: Add a metadata scrub routine

Add a new storage integrity routine that scans all current and backup box
metadata.

Initial responsibilities:

- coerce invalid entry ids greater than `MONDB_ENTRIES` to `0`
- ignore bank flags for empty entries
- rebuild the used-entry bitmap from actual metadata references

First-pass implementation scope:

- sanitize active and backup box entry ids only
- then call `FlushStorageSystem`
- do not yet attempt duplicate-pointer repair
- do not yet change mutation ordering
- do not yet change fatal integrity traps

Note that this is not the same as fully deduplicating metadata references.
`FlushStorageSystem` currently rebuilds allocation flags, but it does not repair
two box slots that already point at the same pokedb entry.

This should be the first hardening step because it is low risk and directly
targets corruption propagation.

Suggested hook points:

- at `UseBillsPC`
- before storage allocation paths that currently rely on the bitmap
- optionally during save/load recovery paths

### Phase 2: Replace freeze loops with recoverable errors

Change fatal loops in storage helpers into normal error returns.

Targets:

- `GetStorageBoxPointer`
- `AddStorageMon`

Preferred behavior:

- return carry or a small error code
- abort the current Bill's PC action
- display a generic storage error message instead of freezing

This does not repair corruption by itself, but it converts mysterious freezes
into a controlled failure mode.

### Phase 3: Run integrity rebuild earlier

At present, `FlushStorageSystem` is mostly used as a last resort when
`NewStoragePointer` fails to find free space.

Hardening option:

- run the scrub/rebuild path proactively at `UseBillsPC`
- or run it before `NewStoragePointer` allocations

This reduces the chance that stale allocation flags are used for a normal
deposit/move operation.

### Phase 4: Detect duplicate metadata pointers

Extend the scrub to detect repeated `(bank, entry)` pairs across current and
backup box metadata.

This is the most likely signature for duplication caused by interrupted or
corrupted state.

Conservative repair policy:

- preserve the first reference encountered
- clear later duplicate references to `0`

This is intentionally biased toward avoiding aliasing, even if it means a later
corrupt slot becomes blank.

### Phase 5: Add an in-progress storage transaction marker

Add a small marker indicating that a Bill's PC storage mutation is in progress.

Flow:

1. set marker before multi-step mutation
2. clear marker after successful completion
3. on load or on Bill's PC entry, if marker is set, run scrub/rebuild first

This is a smaller and safer change than trying to make all storage writes fully
atomic.

Important constraint:

- this marker must live in SRAM, not WRAM

If the game is reset or crashes, WRAM will not preserve the information needed
for recovery.

### Phase 6: Revisit mutation ordering only if needed

Only after the above changes should the actual mutation ordering be reconsidered.

This is the riskiest area because some current ordering is intentional. For
example, `UpdateStorageBoxMonFromTemp` clears the old pointer first so a tempmon
editing session can continue to reuse storage without requiring an immediate
save.

Changing that behavior may improve interruption safety, but it could also break
existing assumptions.

## Recommended Implementation Order

1. Add the metadata scrub routine.
2. Hook it at `UseBillsPC`.
3. Rebuild allocation flags proactively by calling `FlushStorageSystem`.
4. Build and review that first pass in isolation.
5. Replace fatal storage loops with recoverable errors.
6. Add duplicate-pointer detection and repair.
7. Add an in-progress mutation marker if needed.
8. Only then consider deeper mutation-ordering changes.

## Why This Order

This order prioritizes:

- preventing freezes
- containing corrupted metadata
- reducing aliasing risk
- minimizing behavioral change to healthy saves

It deliberately avoids starting with invasive rewrites of the swap/update logic.

## Open Questions

1. Should duplicate-pointer repair clear later duplicates automatically, or only
   surface an error and refuse PC access?
2. Should the scrub run only on Bill's PC entry, or also during normal game load?
3. Should storage integrity errors block saving until repaired, or just block PC
   actions?
4. Is there an appropriate SRAM byte for the transaction marker, or do we need
   to allocate a new one?

## Recommendation

Start with the narrow Phase 1 first pass only:

- sanitize active and backup metadata
- rebuild allocation flags at Bill's PC entry
- stop there and review behavior before changing deeper routines

If user reports continue after that, Phase 4 and Phase 5 become the next most
valuable additions.
