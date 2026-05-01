	db BELDUM ; 190

	db  40,  55,  80,  30,  35,  60
	;   hp  atk  def  spd  sat  sdf

    db STEEL, PSYCHIC_TYPE ; type
    db 45 ; catch rate
	db 144 ; base exp
	db METAL_COAT, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dratini/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm ANCIENTPOWER, HEADBUTT, TOXIC, BODY_SLAM, HYPER_BEAM, PROTECT, SUBSTITUTE, THUNDER, RETURN, DOUBLE_EDGE, SLEEP_TALK, SWIFT, REST, FLASH, THUNDERBOLT, THUNDER_WAVE, PSYCHIC_M, CALM_MIND, AURA_SPHERE, EARTHQUAKE, EARTH_POWER, ROCK_SLIDE
	; end
