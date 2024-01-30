// Dump your new markings here for the sake of differentiating it from the old stuff

//Tails
/datum/sprite_accessory/tail/jackal
	name = "Jackal tail"
	icon = 'z_modular_equinox/icons/mob/equinox-tails.dmi'
	icon_state = "jackal_bicolor"
	extra_overlay = "jackal_bicolor_extra"
	do_colouration = TRUE
	blend = ICON_MULTIPLY

//Body Markings
/datum/sprite_accessory/marking/syzygy/jackal
	name = "Jackal Bare Back"
	icon = 'z_modular_equinox/icons/mob/equinox-markings.dmi'
	icon_state = "jackal_bareback"
	body_parts = list(BP_CHEST, BP_GROIN, BP_L_ARM, BP_R_ARM)
	blend = ICON_MULTIPLY

/datum/sprite_accessory/marking/syzygy/jackalspotted
	name = "Jackal Back Markings"
	icon = 'z_modular_equinox/icons/mob/equinox-markings.dmi'
	icon_state = "jackal_backpattern"
	body_parts = list(BP_CHEST, BP_L_ARM, BP_R_ARM)
	blend = ICON_MULTIPLY
