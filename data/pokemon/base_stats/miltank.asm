	db MILTANK ; 241

	db  95,  80, 105, 100,  40,  70
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FAIRY ; type
	db 45 ; catch rate
	db 200 ; base exp
	db MOOMOO_MILK, MOOMOO_MILK ; items
	db GENDER_F100 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/miltank/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, BODY_SLAM, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, SUNNY_DAY, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, IRON_HEAD, THUNDER, EARTHQUAKE, EARTH_POWER, RETURN, DOUBLE_EDGE, SHADOW_BALL, ICE_PUNCH, SLEEP_TALK, SANDSTORM, THUNDERPUNCH, REST, FIRE_PUNCH, SURF, STRENGTH, THUNDERBOLT, THUNDER_WAVE, ICE_BEAM, IRON_HEAD, BULK_UP
	; end
