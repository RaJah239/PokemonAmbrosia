	db DRILBUR ; 165

	db  60,  85,  40,  68,  30,  45
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db 150 ; catch rate
	db 87 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/drilbur/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, HEADBUTT, BODY_SLAM, CURSE, TOXIC, ROCK_SMASH, HYPER_BEAM, PROTECT, SUBSTITUTE, IRON_HEAD, EARTHQUAKE, EARTH_POWER, ROCK_SLIDE, RETURN, DOUBLE_EDGE, DIG, SLEEP_TALK, SANDSTORM, REST, ROCK_SLIDE, STRENGTH, SWORDS_DANCE
	; end
