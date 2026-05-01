	db FERROSEED ; 088

	db  44,  50,  91,  10,  24,  86
	;   hp  atk  def  spd  sat  sdf

	db GRASS, STEEL ; type
	db 255 ; catch rate
	db 61 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/bellsprout/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_PLANT, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, SUNNY_DAY, PROTECT, GIGA_DRAIN, SUBSTITUTE, SOLARBEAM, RETURN, DOUBLE_EDGE, SLEEP_TALK, SLUDGE_BOMB, REST, CUT, FLASH, THUNDER_WAVE, SELFDESTRUCT, EXPLOSION, SWORDS_DANCE
	; end
