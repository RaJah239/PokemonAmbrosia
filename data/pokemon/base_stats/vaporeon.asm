	db VAPOREON ; 134

	db 130,  65,  60,  65, 110,  95
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 196 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/vaporeon/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, SUNNY_DAY, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, RETURN, DOUBLE_EDGE, SHADOW_BALL, DARK_PULSE, SLEEP_TALK, SWIFT, REST, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM, CALM_MIND, IRON_HEAD
	; end
