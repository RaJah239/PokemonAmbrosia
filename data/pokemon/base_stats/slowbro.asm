	db SLOWBRO ; 080

	db  95,  75, 110,  30, 100,  80
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC_TYPE ; type
	db 75 ; catch rate
	db 164 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/slowbro/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm ANCIENTPOWER, DRAIN_PUNCH, BODY_SLAM, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, SUNNY_DAY, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, IRON_HEAD, EARTHQUAKE, EARTH_POWER, RETURN, DOUBLE_EDGE, DIG, PSYCHIC_M, CALM_MIND, AURA_SPHERE, SHADOW_BALL, DARK_PULSE, ICE_PUNCH, SLEEP_TALK, FIRE_BLAST, SWIFT, REST, SURF, STRENGTH, FLASH, FLAMETHROWER, ICE_BEAM, CALM_MIND, FISSURE, THUNDER_WAVE, WHIRLPOOL, WATERFALL
	; end
