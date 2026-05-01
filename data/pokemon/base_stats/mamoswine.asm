	db MAMOSWINE ; 083

	db  110,  130,  80,  80,  70,  60
	;   hp  atk  def  spd  sat  sdf

	db ICE, GROUND ; type
	db 50 ; catch rate
	db 207 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ANCIENTPOWER, HEADBUTT, BODY_SLAM, CURSE, ROAR, TOXIC, ROCK_SMASH, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, EARTHQUAKE, EARTH_POWER, ROCK_SLIDE, RETURN, DOUBLE_EDGE, SLEEP_TALK, REST, STRENGTH, ICE_BEAM, IRON_HEAD, FISSURE, DIG
	; end
