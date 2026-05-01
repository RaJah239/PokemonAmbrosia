	db MR__MIME ; 122

	db  40,  45,  65,  90, 100, 120
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, FAIRY ; type
	db 45 ; catch rate
	db 136 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/mr__mime/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, HEADBUTT, CURSE, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, SUBSTITUTE, SOLARBEAM, THUNDER, RETURN, DOUBLE_EDGE, PSYCHIC_M, CALM_MIND, AURA_SPHERE, SHADOW_BALL, DARK_PULSE, ICE_PUNCH, SLEEP_TALK, THUNDERPUNCH, REST, FIRE_PUNCH, FLASH, THUNDERBOLT, THUNDER_WAVE, NASTY_PLOT
	; end
