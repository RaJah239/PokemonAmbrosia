	db HONEDGE ; 013

	db  45,  80,  100,  28,  35,  37
	;   hp  atk  def  spd  sat  sdf

	db STEEL, GHOST ; type
	db 180 ; catch rate
	db 65 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonair/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, PROTECT, RAIN_DANCE, SUBSTITUTE, IRON_HEAD, RETURN, DOUBLE_EDGE, SLEEP_TALK, REST, STRENGTH, CUT, ROCK_SLIDE, EARTHQUAKE, FISSURE, SHADOW_BALL, DARK_PULSE, X_SCISSOR, SWIFT, SWORDS_DANCE, NASTY_PLOT
	; end
