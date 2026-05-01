# Effect Commands Space Plan

## Current state

`engine/battle/effect_commands.asm` is built into the `SECTION "Effect Commands", ROMX` block declared in `main.asm:138`.

The current move-effect command dispatcher in `engine/battle/effect_commands.asm` is local-bank only:

- `DoMove` starts at `engine/battle/effect_commands.asm:40`
- `.ReadMoveEffectCommand` is at `engine/battle/effect_commands.asm:70`
- `.DoMoveEffectCommand` is at `engine/battle/effect_commands.asm:107`
- it looks up a 16-bit address from `BattleCommandPointers` and then does `jp hl`

`BattleCommandPointers` lives in `data/battle/effect_command_pointers.asm:5` and stores only 2-byte addresses, not banked far pointers.

That means battle commands cannot simply be moved to another ROM bank and left in the pointer table unchanged. The current dispatcher assumes the command code is in the same bank as `Effect Commands`.

## What the map says

From the current `pokecrystal.map`:

- `Effect Commands` is in ROMX bank `#13`
- that bank has only `0x000A` bytes free

Other battle-heavy banks are also effectively full once their whole bank is considered:

- ROMX bank `#14` contains `Enemy Trainers` and `VWF`, and has only `0x002F` bytes free total
- ROMX bank `#15` contains `Battle Core`, and has `0x016E` bytes free total
- ROMX bank `#19` contains `Battle Core 2`, and has `0x0030` bytes free total

So this is not a case where battle code can simply be redistributed among the existing nearby battle banks. Those banks do not have enough headroom to matter.

## Can we add an `effect_commands_2` section?

Yes.

The straightforward way is to add a new ROMX section, for example:

```asm
SECTION "Effect Commands Overflow", ROMX, BANK[$7C]

INCLUDE "engine/battle/effect_commands_overflow.asm"
```

That new section can live in any bank with enough free space. It does not need to be a "battle" bank already. ROM code is just bytes, and banked calls work the same regardless of what else is in the bank.

The important constraint is this:

- the existing `BattleCommandPointers` table cannot point directly to code in that new bank
- any command that remains reachable through the current dispatcher must still have a local entry label in bank `#13`

So if a command is moved out, bank `#13` needs a small trampoline stub that far-calls the real implementation.

Example pattern:

```asm
BattleCommand_Teleport:
	farcall BattleCommand_Teleport_Overflow
	ret
```

Then the real code would live in `effect_commands_overflow.asm` under `BattleCommand_Teleport_Overflow`.

## Recommended approach

### 1. Keep the current command format

Do not change `BattleCommandPointers` or the `jp hl` dispatcher yet.

That format is simple and stable, and changing it would touch:

- the pointer table format in `data/battle/effect_command_pointers.asm`
- the fetch logic in `DoMove`
- every battle command entry

It is possible, but it is a much larger refactor than the space problem requires.

### 2. Add an overflow bank and use local trampolines

This is the lowest-risk solution.

The pattern would be:

1. Create `engine/battle/effect_commands_overflow.asm`
2. Add `SECTION "Effect Commands Overflow", ROMX, BANK[$7C]` in `main.asm`
3. Move selected command implementations there
4. Leave tiny bank-13 stubs with the original `BattleCommand_*` labels
5. Convert any calls from the moved code back into bank-13 battle helpers to `farcall` as needed

This preserves:

- the current 1-byte command ids
- the current 2-byte pointer table
- the current dispatcher

### 3. Use the existing `move_effects/*.asm` files as the split units

This repo is already partway structured for the split.

Many command implementations already live in separate files and are only pulled into bank `#13` by `INCLUDE` lines inside `engine/battle/effect_commands.asm`.

That means the easiest split is not by carving random chunks out of the middle of one giant file. It is by moving individual `move_effects/*.asm` implementations out of the `Effect Commands` section and into the new overflow section.

## Best candidate banks

The roomiest current ROMX banks from the map are:

- bank `#124` with `13864` bytes free
- bank `#123` with `12072` bytes free
- bank `#116` with `10582` bytes free
- bank `#115` with `10309` bytes free
- bank `#120` with `9792` bytes free

Using a fixed high bank such as `BANK[$7C]` (decimal `124`) is a good default because:

- it has plenty of space
- it is far away from the crowded battle banks
- it reduces the chance that small unrelated battle edits reshuffle where the overflow code lands

If deterministic bank placement is not important, the new section could also be left unpinned and allowed to float. I do not recommend that here. A fixed bank makes future debugging easier.

## Good first commands to move

The best first targets are commands that are already isolated in `engine/battle/move_effects/*.asm` and are not in the hottest parts of the damage pipeline.

Good first-wave candidates:

- `teleport.asm`
- `encore.asm`
- `sketch.asm`
- `sleep_talk.asm`
- `pain_split.asm`

Why these are good first candidates:

- they already live in separate files
- they are not as central as damage, hit check, or stat recalculation
- moving them mainly costs a local stub plus a few `farcall` conversions

Second-wave candidates:

- `transform.asm`
- `substitute.asm`
- `thief.asm`
- `rollout.asm`

These are larger and can save more space, but they are also more coupled to other battle helpers, so they should come after the first wave.

## Commands and routines that are poor first candidates

I would avoid moving these first:

- `BattleCommand_Stab`
- `BattleCommand_DamageStats`
- `BattleCommand_DamageCalc`
- `BattleCommand_CheckHit`
- the generic stat up/down routines

Those are central, frequently used, and tightly woven into other local battle code. They are the worst places to add farcall overhead and the highest-risk places to make cross-bank mistakes.

## Cheap byte-recovery opportunities

Before moving whole commands, a small amount of space can be recovered by consolidating obviously dead or no-op commands.

Examples already visible in the current tree:

- `BattleCommand_DefrostOpponent` is just `ret`
- `BattleCommand_BeatUp` and `BattleCommand_BeatUpFailText` are removed and just `ret`
- `BattleCommand_DoubleMinimizeDamage` is just `ret`
- `BattleCommand_CheckFutureSight` and `BattleCommand_FutureSight` are both stubbed out in `engine/battle/move_effects/future_sight.asm`
- `BattleCommand_Present`, `BattleCommand_Foresight`, `BattleCommand_FrustrationPower`, and `BattleCommand_Endure` already share a common `ret`

This is only a small win, not a real solution. It is still worth doing because bank `#13` is down to 10 bytes free, so even tiny recoveries help.

## Alternative: redesign the command pointer format

There is a more ambitious option:

- change `BattleCommandPointers` from 2-byte local addresses to 3-byte far pointers
- change the dispatcher to read bank + address and far-call the command directly

Pros:

- battle commands could live in any bank
- no per-command trampoline stubs would be needed
- this fully future-proofs battle command growth

Cons:

- larger refactor
- wider test surface
- touches the core move-effect interpreter
- every command invocation becomes bank-aware

I would only do this if you expect a long series of future battle-command expansions. For the current codebase, the trampoline model is more economical.

## Suggested implementation order

1. Consolidate the obvious no-op commands to recover a few bytes in bank `#13`.
2. Add `SECTION "Effect Commands Overflow", ROMX, BANK[$7C]`.
3. Create `engine/battle/effect_commands_overflow.asm`.
4. Move one low-risk command first, such as `Teleport`, using a bank-13 trampoline.
5. Rebuild and test that one command thoroughly.
6. Move additional isolated commands one at a time.

This keeps each step small and debuggable.

## Bottom line

Yes, an `effect_commands_2` style split is viable, but it should be done as:

- a new overflow ROMX section in a roomy bank
- with bank-13 trampoline labels preserved for `BattleCommandPointers`
- using existing `move_effects/*.asm` files as the migration units

Trying to "redistribute" among the current battle banks will not help much, because those banks are also nearly full in total. The practical solution is an overflow bank, not a local reshuffle.
