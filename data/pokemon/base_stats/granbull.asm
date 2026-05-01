	db GABITE ; 210

	db  68, 90,  65,  82,  50,  55
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, GROUND ; type
    db 45 ; catch rate
	db 218 ; base exp
	db NO_ITEM, DRAGON_SCALE ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/gabite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, SUBSTITUTE, IRON_HEAD, DRAGON_PULSE, THUNDER, RETURN, DOUBLE_EDGE, ICE_PUNCH, SLEEP_TALK, SANDSTORM, FIRE_BLAST, SWIFT, THUNDERPUNCH, REST,  FIRE_PUNCH, STRENGTH, EARTHQUAKE, EARTH_POWER, FLAMETHROWER, THUNDERBOLT, THUNDER_WAVE, ICE_BEAM
	; end
