	db SNEASLER ; 116

	db  80, 130,  60,  120,  40,  80
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, POISON ; type
	db 45 ; catch rate
	db 179 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SLUDGE_BOMB, PROTECT, RAIN_DANCE, SUNNY_DAY, SUBSTITUTE, IRON_HEAD, RETURN, DOUBLE_EDGE, DIG, THUNDERPUNCH, FIRE_PUNCH, ICE_PUNCH, SLEEP_TALK, SWIFT, REST, CUT, ROCK_SLIDE, STRENGTH, SWORDS_DANCE, NASTY_PLOT, TAUNT, X_SCISSOR, BULK_UP, CALM_MIND
	; end
