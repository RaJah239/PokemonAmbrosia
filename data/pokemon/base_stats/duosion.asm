	db DUOSION ; 107

	db  65, 40,  50,  30,  125, 60
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 100 ; catch rate
	db 130 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm ANCIENTPOWER, HEADBUTT, CURSE, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, SUBSTITUTE, RETURN, DOUBLE_EDGE, PSYCHIC_M, CALM_MIND, AURA_SPHERE, SHADOW_BALL, DARK_PULSE, SLEEP_TALK, REST, FLASH, THUNDER, THUNDERBOLT, THUNDER_WAVE, EARTH_POWER
	; end
