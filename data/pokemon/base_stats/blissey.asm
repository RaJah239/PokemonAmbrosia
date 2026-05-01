	db BLISSEY ; 242

	db 255,  10,  10,  55,  75, 135
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 30 ; catch rate
	db 255 ; base exp
	db LUCKY_EGG, NO_ITEM  ; items
	db GENDER_F100 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/blissey/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_FAIRY, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, HEADBUTT, BODY_SLAM, CURSE, TOXIC, ROCK_SMASH, SUNNY_DAY, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, SOLARBEAM, THUNDER, RETURN, DOUBLE_EDGE, PSYCHIC_M, CALM_MIND, AURA_SPHERE, SHADOW_BALL, DARK_PULSE, SLEEP_TALK, SANDSTORM, FIRE_BLAST, REST, STRENGTH, FLASH, FLAMETHROWER, THUNDERBOLT, THUNDER_WAVE, ICE_BEAM, DARK_PULSE, SWIFT
	; end
