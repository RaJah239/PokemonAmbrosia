	db SUICUNE ; 245

	db 100,  75, 115,  85,  90, 115
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 3 ; catch rate
	db 220 ; base exp
	db MYSTIC_WATER, MYSTIC_WATER ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/suicune/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, ROCK_SMASH, SUNNY_DAY, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, IRON_HEAD, RETURN, DOUBLE_EDGE, DIG, SLEEP_TALK, SANDSTORM, SWIFT, REST, CUT, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM, CALM_MIND
	; end
