	db FLAAFFY ; 180

	db  70,  55,  55,  45,  80,  60
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 120 ; catch rate
	db 117 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/flaaffy/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, HEADBUTT, BODY_SLAM, CURSE, TOXIC, ROCK_SMASH, PROTECT, RAIN_DANCE, SUBSTITUTE, IRON_HEAD, THUNDER, RETURN, DOUBLE_EDGE, SLEEP_TALK, SWIFT, THUNDERPUNCH, REST, FIRE_PUNCH, STRENGTH, FLASH, THUNDERBOLT, THUNDER_WAVE, CALM_MIND
	; end
