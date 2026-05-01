	db EXCADRILL ; 166

	db  110,  135,  60,  88,  50, 65
	;   hp  atk  def  spd  sat  sdf

	db GROUND, STEEL ; type
	db 75 ; catch rate
	db 124 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/excadrill/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, HEADBUTT, BODY_SLAM, CURSE, TOXIC, ROCK_SMASH, HYPER_BEAM, PROTECT, SUBSTITUTE, IRON_HEAD, EARTHQUAKE, EARTH_POWER, ROCK_SLIDE, RETURN, DOUBLE_EDGE, DIG, SLEEP_TALK, SANDSTORM, REST, STRENGTH, SWORDS_DANCE, HORN_DRILL, FISSURE
	; end
