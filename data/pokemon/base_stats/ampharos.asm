	db AMPHAROS ; 181

	db  90,  75,  75,  55, 115,  90
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 194 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/ampharos/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, IRON_HEAD, HEADBUTT, BODY_SLAM, CURSE, TOXIC, ROCK_SMASH, HYPER_BEAM, PROTECT, RAIN_DANCE, SUBSTITUTE, THUNDER, RETURN, DOUBLE_EDGE, SLEEP_TALK, SWIFT, THUNDERPUNCH, REST, FIRE_PUNCH, STRENGTH, FLASH, THUNDERBOLT, DRAGON_PULSE, FLAMETHROWER, ICE_PUNCH, AURA_SPHERE, THUNDER_WAVE, CALM_MIND
	; end
