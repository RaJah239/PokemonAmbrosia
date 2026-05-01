	db TOGETIC ; 176

	db  55,  40,  85,  40,  80, 105
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FLYING ; type
	db 75 ; catch rate
	db 114 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/togetic/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_FLYING, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, BODY_SLAM, CURSE, TOXIC, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, SUBSTITUTE, SOLARBEAM, RETURN, DOUBLE_EDGE, PSYCHIC_M, CALM_MIND, AURA_SPHERE, SHADOW_BALL, DARK_PULSE, SLEEP_TALK, FIRE_BLAST, SWIFT, REST,  FLY, FLASH, FLAMETHROWER, NASTY_PLOT, THUNDER_WAVE
	; end
