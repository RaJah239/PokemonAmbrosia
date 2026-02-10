	object_const_def
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenter_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING

	def_callbacks

.DummyScene0:
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterScientist1Script:
    jumptextfaceplayer RuinsOfAlphResearchCenterScientist1Text

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	writetext RuinsOfAlphResearchCenterScientist2Text
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterComputer:
	opentext
	writetext RuinsOfAlphResearchCenterComputerText
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterBookshelf:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText

RuinsOfAlphResearchCenterScientist3Text:
	text "The Unown you"
	line "catch will all be"
	cont "recorded."

	para "Of course there"
	line "is no good reason"
	cont "to catch them."

	para "Just a curiosity."
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "The Ruins are"
	line "about 1500 years"
	cont "old."

	para "Buried underground"
	line "is the city of"
	cont "Menzoberranzan."

	para "It is believed"
	line "that the ruler"
	cont "of the ancient"
	cont "city was a man"
	cont "named Atem."

	para "It is believed he"
	line "was the most"
	cont "powerful trainer"
	cont "to ever exist."

	para "The Master of"
	line "Masters."

	para "However he was not"
	line "worshiped."

	para "The ancient people"
	line "worshiped the"
	cont "creator."

	para "The name of this"
	line "creator begins"
	cont "with A and is 6"
	cont "characters long."

	para "It must be Arceus."
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "You are the one"
	line "the prophesy"
	cont "speaks of."

	para "The prophesy I"
	line "just made up!"

	para "Only you can"
	line "do it."

	para "Find and solve"
	line "all the puzzles."

	para "There are 3 in"
	line "total."

	para "Or maybe there"
	line "are 4..."

	para "Only when they"
	line "are all solved"
	cont "might the secret"
	cont "be revealed."
	done

RuinsOfAlphResearchCenterComputerText:
	text "Ruins of Alph"

	para "Exploration"
	line "Year 10"
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "This doesn't seem"
	line "to work yet."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "There are many"
	line "academic books."

	para "Wait..."

	para "In the back..."

	para "A Digimon book!"
	done

RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 6
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 6

	def_coord_events

	def_bg_events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  4, BGEVENT_READ, RuinsOfAlphResearchCenterComputer

	def_object_events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
