	db METAGROSS ; 192

	db  80,  135,  130,  70, 95,  90
	;   hp  atk  def  spd  sat  sdf

	db STEEL, PSYCHIC_TYPE ; type
    db 45 ; catch rate
	db 218 ; base exp
	db NO_ITEM, METAL_COAT ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm ANCIENTPOWER, TOXIC, BODY_SLAM, HYPER_BEAM, PROTECT, SUBSTITUTE, THUNDER, RETURN, DOUBLE_EDGE, SLEEP_TALK, SWIFT, REST, FLASH, PSYCHIC_M, CALM_MIND, AURA_SPHERE, EARTHQUAKE, EARTH_POWER, ROCK_SLIDE, THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, DRAIN_PUNCH
	; end
