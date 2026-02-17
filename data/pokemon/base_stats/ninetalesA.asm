	db NINETALES_A ; 178
	db  73,  67,  75,  109,  100,  100
	;   hp  atk  def  spd  sat  sdf

	db ICE, FAIRY ; type
	db 75 ; catch rate
	db 177 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, HIDDEN_POWER, HYPER_BEAM, PROTECT, SUBSTITUTE, IRON_HEAD, RETURN, DOUBLE_EDGE, DIG, SLEEP_TALK, BLIZZARD, SWIFT, REST, ICE_BEAM, NASTY_PLOT, AURA_SPHERE, GIGA_DRAIN, SHADOW_BALL, DARK_PULSE, PSYCHIC_M, FLASH, ICY_WIND
	; end
