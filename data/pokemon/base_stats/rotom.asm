	db ROTOM ; 027

	db  50,  65, 107,  86, 105, 107
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, GHOST ; type
	db 45 ; catch rate
	db 154 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, SUBSTITUTE, THUNDER, RETURN, DOUBLE_EDGE, PSYCHIC_M, CALM_MIND, SHADOW_BALL, DARK_PULSE, SLEEP_TALK, SWIFT, REST, FLASH, THUNDERBOLT, NASTY_PLOT, SURF, THUNDER_WAVE
	; end
