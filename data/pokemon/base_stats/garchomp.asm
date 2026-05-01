	db GARCHOMP ; 211

	db  108,  130,  95,  102,  80,  85
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, GROUND ; type
    db 45 ; catch rate
	db 218 ; base exp
	db NO_ITEM, DRAGON_SCALE ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/garchomp/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm ANCIENTPOWER, HEADBUTT, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, SUBSTITUTE, IRON_HEAD, DRAGON_PULSE, THUNDER, RETURN, DOUBLE_EDGE, SLEEP_TALK, SANDSTORM, FIRE_BLAST, SWIFT, REST, X_SCISSOR, CUT, STRENGTH, FLY, EARTHQUAKE, EARTH_POWER, ROCK_SLIDE, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, SWORDS_DANCE, DIG, FISSURE
	; end
