	db POLTEGEIST ; 028

	db  60, 65, 65,  70,  134,  114
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GHOST ; type
	db 60 ; catch rate
	db 178 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/poltegeist/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, GIGA_DRAIN, AURA_SPHERE, PROTECT, SUBSTITUTE, RETURN, DOUBLE_EDGE, SHADOW_BALL, SLEEP_TALK, SWIFT, REST, FLASH, NASTY_PLOT, DARK_PULSE
	; end
