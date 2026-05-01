	db RHYHORN ; 111

	db  80,  85,  95,  25,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db GROUND, ROCK ; type
	db 120 ; catch rate
	db 135 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/rhyhorn/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ANCIENTPOWER, HEADBUTT, BODY_SLAM, CURSE, ROAR, TOXIC, ROCK_SMASH, SUNNY_DAY, BLIZZARD, ICE_BEAM, ICY_WIND, PROTECT, SUBSTITUTE, IRON_HEAD, THUNDER, EARTHQUAKE, EARTH_POWER, ROCK_SLIDE, RETURN, DOUBLE_EDGE, DIG, SLEEP_TALK, SANDSTORM, FIRE_BLAST, REST, STRENGTH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, SWORDS_DANCE, HORN_DRILL, FISSURE
	; end
