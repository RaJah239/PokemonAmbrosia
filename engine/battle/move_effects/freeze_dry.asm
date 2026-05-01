BattleCommand_FreezeDry:

	jp BattleCommand_DamageStats

FreezeDryOverrideMatchedType:
	push af
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_FREEZE_DRY
	jr z, .check_type
	pop af
	and a
	ret

.check_type
	pop af
	cp WATER
	jr z, .override
	and a
	ret

.override
	ld a, SUPER_EFFECTIVE
	scf
	ret
