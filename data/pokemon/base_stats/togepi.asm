	db TOGEPI ; 175

	db  35,  20,  65,  20,  40,  65
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY ; type
	db 190 ; catch rate
	db 74 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/togepi/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm ANCIENTPOWER, HEADBUTT, BODY_SLAM, CURSE, TOXIC, ROCK_SMASH, SUNNY_DAY, PROTECT, RAIN_DANCE, SUBSTITUTE, SOLARBEAM, RETURN, DOUBLE_EDGE, PSYCHIC_M, CALM_MIND, AURA_SPHERE, SHADOW_BALL, DARK_PULSE, SLEEP_TALK, FIRE_BLAST, SWIFT, REST, FLASH, FLAMETHROWER, NASTY_PLOT, THUNDER_WAVE
	; end
