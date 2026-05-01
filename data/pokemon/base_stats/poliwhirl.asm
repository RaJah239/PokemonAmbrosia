	db POLIWHIRL ; 061

	db  65,  65,  65,  90,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 120 ; catch rate
	db 131 ; base exp
	db KINGS_ROCK, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/poliwhirl/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, BODY_SLAM, CURSE, TOXIC, ROCK_SMASH, BLIZZARD, ICE_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, EARTHQUAKE, EARTH_POWER, RETURN, DOUBLE_EDGE, PSYCHIC_M, ICE_PUNCH, SLEEP_TALK, REST, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
