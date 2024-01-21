//EQUINOX CONTENT - Furry species and overrides

/datum/species/sergal
	name = SPECIES_SERGAL
	name_plural = "Sergals"
	icobase = 'z_modular_equinox/icons/mob/human_races/r_sergal.dmi'
	deform = 'z_modular_equinox/icons/mob/human_races/r_def_sergal.dmi'
	tail = "tail"
	tail_animation = 'z_modular_equinox/icons/mob/human_races/r_sergal.dmi'
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	num_alternate_languages = 3
	color_mult = TRUE

	sprite_compatibility_mode = FALSE	//Enable jank code so that virgo's species dmis don't need to be extensively butchered to work with eris' system. Affects organ_icon.dm stuff.

	min_age = 18
	max_age = 80

	blurb = "Hailing from the arboreal world of Talvis-Epsilon III, or more commonly known as 'Tal'. Sergals are one of two sapient species \
	that have become a protectorate under Solgov after what was known as the 'Antelope Incident'. Sergals are tall canopy hunters with strong, \
	balancing tails, prehensile feet and dense muscles. While not strictly carnivores, their culture and bodies favor meat. Sergals are only about two \
	generations new to star-faring society and struggle to find their place in the galaxy."

	spawn_flags = CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#777777"

	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

/datum/species/akula
	name = SPECIES_AKULA
	name_plural = "Shucan"
	icobase = 'z_modular_equinox/icons/mob/human_races/r_akula.dmi'
	deform = 'z_modular_equinox/icons/mob/human_races/r_def_akula.dmi'
	tail = "tail"
	tail_animation = 'z_modular_equinox/icons/mob/human_races/r_akula.dmi'
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	num_alternate_languages = 3
	color_mult = TRUE

	sprite_compatibility_mode = TRUE	//Enable jank code so that virgo's species dmis don't need to be extensively butchered to work with eris' system. Affects organ_icon.dm stuff.

	min_age = 18
	max_age = 80

	blurb = "Originating from Shoudona, the Shucan are selachimorphs hailing from the Shoussin Union, at the outermost edge of the Cygnus Region. \
	They are tall, hard-built humanoids, with a soft underbelly. Their language 'Shoudin' is compromised majorily of consonants pronounced in varying vibrations,\
	giving them a distinct accent aswell as often showing their teeth when speaking. Most Shucan working in UTS territories are pilgrims from their homeland, \
	come to expand their horizons and worldview, either by choice or by their beliefs." //Occulus edit

	spawn_flags = CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#777777"
	blood_color = "#1D2CBF"

/datum/species/nevrean
	name = SPECIES_NEVREAN
	name_plural = "Nevreans"
	icobase = 'z_modular_equinox/icons/mob/human_races/r_nevrean.dmi'
	deform = 'z_modular_equinox/icons/mob/human_races/r_def_nevrean.dmi'
	tail = "tail"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	num_alternate_languages = 3
	color_mult = TRUE

	sprite_compatibility_mode = TRUE

	min_age = 18
	max_age = 80

	blurb = "One of Tal's two sapient species, Nevreans are an avian species that stand nearly a third shorter than most sapient species, known as extremely \
	bright and social creatures, they have taken to rapid advancement into the space age better than their neighbors. Nevreans themselves are omnivores with \
	lithe bodies and flightless, winged arms that work well in groups and have found themselves better in people-facing careers rather than physical due to their \
	colorful and 'pretty' nature. However this has given them a promiscuous stereotype. "

	spawn_flags = CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#333333"

	heat_discomfort_strings = list(
		"Your plumage prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

/datum/species/hi_zoxxen
	name = SPECIES_ZORREN_HIGH
	name_plural = "Zorren"
	icobase = 'z_modular_equinox/icons/mob/human_races/r_fox_vr.dmi'
	deform = 'z_modular_equinox/icons/mob/human_races/r_def_fox.dmi'
	tail = "tail"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	num_alternate_languages = 3
	secondary_langs = list()

	sprite_compatibility_mode = TRUE

	min_age = 18
	max_age = 80

	blurb = "The fox-like Zorren are native to Virgo-Prime, however there are two distinct varieties of Zorren one with large ears and shorter fur, \
	and the other with longer fur that is a bit more vibrant. The long-eared, short-furred Zorren have come to be known as Flatland Zorren as that \
	is where most of their settlements are located. The Flatland Zorren are somewhat tribal and shamanistic as they have only recently started to be \
	hired by the Trans-Stellar Corporations. The other variety of Zorren are known as Highland Zorren as they frequently settle in hilly and/or \
	mountainous areas, they have a differing societal structure than the Flatland Zorren having a more feudal social structure, like the Flatland Zorren, \
	the Highland Zorren have also only recently been hired by the Trans-Stellar Corporations, but thanks to the different social structure they seem to \
	have adjusted better to their new lives. Though similar fox-like beings have been seen they are different than the Zorren."

	spawn_flags = CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR
	flesh_color = "#AFA59E"
	base_color = "#333333"
	blood_color = "#240bc4"
	color_mult = TRUE

	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

/datum/species/fl_zorren
	name = SPECIES_ZORREN_FLAT
	name_plural = "Zorren"
	icobase = 'z_modular_equinox/icons/mob/human_races/r_fennec_vr.dmi'
	deform = 'z_modular_equinox/icons/mob/human_races/r_def_fennec.dmi'
	tail = "tail"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	num_alternate_languages = 3
	secondary_langs = list()

	sprite_compatibility_mode = TRUE


	min_age = 18
	max_age = 80

	blurb = "The fox-like Zorren are native to Virgo-Prime, however there are two distinct varieties of Zorren one with large ears and shorter fur, \
	and the other with longer fur that is a bit more vibrant. The long-eared, short-furred Zorren have come to be known as Flatland Zorren as that is \
	where most of their settlements are located. The Flatland Zorren are somewhat tribal and shamanistic as they have only recently started to be \
	hired by the Trans-Stellar Corporations. The other variety of Zorren are known as Highland Zorren as they frequently settle in hilly and/or \
	mountainous areas, they have a differing societal structure than the Flatland Zorren having a more feudal social structure, like the Flatland Zorren, \
	the Highland Zorren have also only recently been hired by the Trans-Stellar Corporations, but thanks to the different social structure they \
	seem to have adjusted better to their new lives. Though similar fox-like beings have been seen they are different than the Zorren."

	spawn_flags = CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#333333"
	blood_color = "#240bc4"
	color_mult = TRUE

	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)


/datum/species/vulpkanin
	name = SPECIES_VULPKANIN
	name_plural = "Vulpkanin"
	icobase = 'z_modular_equinox/icons/mob/human_races/r_vulpkanin.dmi'
	deform = 'z_modular_equinox/icons/mob/human_races/r_vulpkanin.dmi'
	tail = "vulptail"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	darksight = 5
	num_alternate_languages = 3
	color_mult = TRUE

	sprite_compatibility_mode = TRUE

	blurb = "Vulpkanin is the Galactic Common name for a species of canine-genus upright humanoids that hail from the Vazzend system, \
	before contact from the Skrell the Vulpkanin were a heavily industrial pre-FTL species that had colonized and exploited most of their \
	home system, now a protectorate under the Skrellian Diplomatic Fleets with a corruption-heavy government." //Occulus edit

	spawn_flags = CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#966464"
	base_color = "#B43214"

	min_age = 18
	max_age = 80

/datum/species/unathi
	name = SPECIES_UNATHI
	name_plural = "Unathi"
	spawn_flags = CAN_JOIN //CAN_JOIN is the only spawn flag all the races get, so that none of them will be whitelist only if whitelist is enabled.
	icobase = 'z_modular_equinox/icons/mob/human_races/r_lizard_vr.dmi'
	deform = 'z_modular_equinox/icons/mob/human_races/r_def_lizard_vr.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR
	color_mult = TRUE
	min_age = 18
	gluttonous = 0
	sprite_compatibility_mode = TRUE

/datum/species/tajaran
	name = SPECIES_TAJ
	name_plural = "Tajaran"
	tail = "tajtail"
	spawn_flags = CAN_JOIN
	icobase = 'z_modular_equinox/icons/mob/human_races/r_tajaran_vr.dmi'
	deform = 'z_modular_equinox/icons/mob/human_races/r_def_tajaran_vr.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR
	color_mult = TRUE
	min_age = 18
	gluttonous = 0

	sprite_compatibility_mode = TRUE

/datum/species/human/vatgrown
	name = SPECIES_VATGROWN
	spawn_flags = CAN_JOIN
	color_mult = TRUE
	icobase = 'z_modular_equinox/icons/mob/human_races/r_human_vr.dmi'
	deform = 'z_modular_equinox/icons/mob/human_races/r_def_human_vr.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR
	min_age = 18
	base_color = "#EECEB3"
	sprite_compatibility_mode = TRUE
