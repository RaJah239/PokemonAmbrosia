	db MILOTIC ; 099

	db  95, 60, 79,  81,  100,  125
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 60 ; catch rate
	db 214 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/gyarados/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_2, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, ROCK_SMASH, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, DRAGON_PULSE, RETURN, DOUBLE_EDGE, SLEEP_TALK, REST, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM, CALM_MIND, DARK_PULSE, IRON_HEAD
	; end
