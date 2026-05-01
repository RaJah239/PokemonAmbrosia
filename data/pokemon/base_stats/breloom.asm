	db BRELOOM ; 057

	db  60, 130,  80,  70,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FIGHTING ; type
	db 255 ; catch rate
	db 161 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, BULK_UP, BODY_SLAM, CURSE, TOXIC, SUNNY_DAY, PROTECT, GIGA_DRAIN, SUBSTITUTE, SOLARBEAM, RETURN, DOUBLE_EDGE, SLEEP_TALK, SLUDGE_BOMB, REST, CUT, FLASH, SWORDS_DANCE, AURA_SPHERE, THUNDERPUNCH
	; end
