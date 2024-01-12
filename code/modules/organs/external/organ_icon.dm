var/global/list/limb_icon_cache = list()

/obj/item/organ/external/set_dir()
	return

/obj/item/organ/external/proc/compile_icon()
	overlays.Cut()
	 // This is a kludge, only one icon has more than one generation of children though.
	for(var/obj/item/organ/external/organ in contents)
		if(organ.children && organ.children.len)
			for(var/obj/item/organ/external/child in organ.children)
				overlays += child.mob_icon
		overlays += organ.mob_icon

/obj/item/organ/external/proc/sync_colour_to_human(var/mob/living/carbon/human/human)
	skin_tone = null
	skin_col = null
	hair_col = null
	if(BP_IS_ROBOTIC(src))
		return
	if(species && human.species && species.name != human.species.name)
		return
	if(!isnull(human.s_tone) && (human.species.appearance_flags & HAS_SKIN_TONE))
		skin_tone = human.s_tone
	if(human.species.appearance_flags & HAS_SKIN_COLOR)
		skin_col = human.skin_color
	hair_col = human.hair_color

/obj/item/organ/external/proc/get_cache_key()
	var/part_key = ""

	if(!appearance_test.get_species_sprite)
		part_key += "forced"
	else
		if(BP_IS_ROBOTIC(src))
			part_key += "ROBOTIC"
		else if(status & ORGAN_MUTATED)
			part_key += "Mutated"
		else if(status & ORGAN_DEAD)
			part_key += "Dead"
		else
			part_key += "Normal"
		part_key += "[species.race_key]"

	if(!appearance_test.colorize_organ)
		part_key += "no_color"

	part_key += "[owner && owner.gender == FEMALE]"
	part_key += "[skin_tone]"
	part_key += skin_col
	part_key += model



	if(!appearance_test.special_update)
		for(var/obj/item/organ/internal/eyes/I in internal_organs)
			part_key += I.get_cache_key()

	// EQUINOX EDIT START - furry - integrates bodymarkings into the icon caching system
	for(var/M in markings)
		part_key += "[M][markings[M]["color"]]"
	// EQUINOX EDIT END /////

	return part_key

/obj/item/organ/external/head/sync_colour_to_human(var/mob/living/carbon/human/human)
	..()
	for(var/obj/item/organ/internal/eyes/eyes in owner.organ_list_by_process(OP_EYES))
		eyes.update_colour()

/obj/item/organ/external/head/removed_mob()
	update_icon(1)
	..()

/obj/item/organ/external/head/update_icon()

	..()
	if(!appearance_test.special_update)
		return mob_icon

	overlays.Cut()
	if(!owner || !owner.species)
		return

	if(!species)
		species = owner.species

	if(owner.species.has_process[OP_EYES] && species.appearance_flags & HAS_EYE_COLOR)
		for(var/obj/item/organ/internal/eyes/eyes in owner.organ_list_by_process(OP_EYES))
			mob_icon.Blend(eyes.get_icon(), ICON_OVERLAY)

	if(owner.lip_style && (species && (species.appearance_flags & HAS_LIPS)))
		var/icon/lip_icon = new/icon('icons/mob/human_face.dmi', "lips[owner.lip_style]")
		mob_icon.Blend(lip_icon, ICON_OVERLAY)

	if(!BP_IS_ROBOTIC(src))
		if(owner.f_style)
			var/datum/sprite_accessory/facial_hair_style = GLOB.facial_hair_styles_list[owner.f_style]
			if(facial_hair_style && facial_hair_style.species_allowed && (species.get_bodytype() in facial_hair_style.species_allowed))
				var/icon/facial = new/icon(facial_hair_style.icon, facial_hair_style.icon_state)
				if(facial_hair_style.do_colouration)
					facial.Blend(owner.facial_color, ICON_ADD)
				overlays |= facial

		if(owner.h_style && !(owner.head && (owner.head.flags_inv & BLOCKHEADHAIR)))
			var/datum/sprite_accessory/hair_style = GLOB.hair_styles_list[owner.h_style]
			if(hair_style && (species.get_bodytype() in hair_style.species_allowed))
				var/icon/hair = new/icon(hair_style.icon, hair_style.icon_state)
				if(hair_style.do_colouration)
					hair.Blend(hair_col, ICON_ADD)
					// EQUINOX EDIT START - Hair Color Gradients
					for(var/M in markings)
						var/datum/sprite_accessory/marking/mark_style = markings[M]["datum"]
						if(mark_style.draw_target == 1)
							var/icon/mark_s = new/icon(mark_style.icon, mark_style.icon_state)
							mark_s.Blend(hair, ICON_AND)
							mark_s.Blend(markings[M]["color"], mark_style.color_blend_mode)
							hair.Blend(mark_s, ICON_OVERLAY)
					// EQUINOX EDIT END - Hair Color Gradients
				overlays |= hair

	// EQUINOX EDIT START - furry
	for(var/M in markings)
		var/datum/sprite_accessory/marking/mark_style = markings[M]["datum"]
		if(!mark_style.draw_target)
			var/icon/mark_s = new/icon("icon" = mark_style.icon, "icon_state" = "[mark_style.icon_state]-[organ_tag]")
			mark_s.Blend(markings[M]["color"], mark_style.color_blend_mode)
			add_overlay(mark_s) //So when it's not on your body, it has icons
			mob_icon.Blend(mark_s, ICON_OVERLAY) //So when it's on your body, it has icons
	// EQUINOX EDIT END /////

	return mob_icon

/obj/item/organ/external/update_icon(regenerate = 0)
	var/gender = "_m"
	gender = owner.gender == FEMALE ? "_f" : "_m"

	// EQUINOX EDIT START - furry
	overlays.Cut()	//Clears out existing bodymarkings

	if(!species && iscarbon(owner))	//Rearranging this up here for jank code reasons
		species = owner.species

	if(species.sprite_compatibility_mode && !BP_IS_ROBOTIC(src))
		if(organ_tag == BP_CHEST)
			icon_state = "torso[gender]"	//species that have the sprite_compatibility_mode var TRUE uses torso instead of chest for the iconstate.
		else if((organ_tag in list(BP_L_LEG, BP_R_LEG, BP_L_ARM, BP_R_ARM)))	//species that have the sprite_compatibility_mode var TRUE don't have gendered limbs.
			icon_state = "[organ_tag]"
		else
			icon_state = "[organ_tag][gender][is_stump()?"_s":""]"	//Only the head and groin should be affected by this.
	else if(appearance_test.simple_setup)
		icon_state = "[organ_tag][gender]"
	else
		icon_state = "[organ_tag][gender][is_stump()?"_s":""]"

	// EQUINOX EDIT END - furry

	if(!appearance_test.get_species_sprite)
		icon = 'icons/mob/human_races/r_human.dmi'
	else
		if(src.force_icon)
			icon = src.force_icon
		else if(!species)
			icon = 'icons/mob/human_races/r_human.dmi'
		else if(BP_IS_ROBOTIC(src))
			icon = 'icons/mob/human_races/cyberlimbs/generic.dmi'
		else if(status & ORGAN_MUTATED)
			icon = species.deform
		else
			icon = species.icobase

	mob_icon = new/icon(icon, icon_state)

	// EQUINOX EDIT START - furry - species that have the sprite_compatibility_mode var TRUE have seperate hands and feet. This merges them in code due to avoid mucking with the dmi. Yes, this is laziness.
	if((organ_tag in list(BP_L_LEG, BP_R_LEG, BP_L_ARM, BP_R_ARM)) && (species.sprite_compatibility_mode) && (!BP_IS_ROBOTIC(src)))
		var/icon/limb_splice

		if(organ_tag == BP_L_LEG)
			limb_splice = new/icon(icon, "l_foot")
		else if(organ_tag == BP_R_LEG)
			limb_splice = new/icon(icon, "r_foot")
		else if(organ_tag == BP_L_ARM)
			limb_splice = new/icon(icon, "l_hand")
		else if(organ_tag == BP_R_ARM)
			limb_splice = new/icon(icon, "r_hand")

		mob_icon.Blend(limb_splice, ICON_OVERLAY)
	// EQUINOX EDIT END - furry

	if(appearance_test.colorize_organ)
		if(status & ORGAN_DEAD)
			mob_icon.ColorTone(rgb(10,50,0))
			mob_icon.SetIntensity(0.7)
		if(skin_tone)
			if(skin_tone >= 0)
				mob_icon.Blend(rgb(skin_tone, skin_tone, skin_tone), ICON_ADD)
			else
				mob_icon.Blend(rgb(-skin_tone,  -skin_tone,  -skin_tone), ICON_SUBTRACT)
		else
			if(skin_col)
				mob_icon.Blend(skin_col, ICON_MULTIPLY) //EQUINOX EDIT - furry

	// EQUINOX EDIT START - furry - apply bodymarkings
	if(!istype(src,/obj/item/organ/external/head))
		for(var/M in markings)
			var/datum/sprite_accessory/marking/mark_style = markings[M]["datum"]
			var/icon/mark_s
			var/icon/mark_splice

			if(organ_tag == BP_CHEST)
				mark_s = new/icon("icon" = mark_style.icon, "icon_state" = "[mark_style.icon_state]-torso")
			else
				mark_s = new/icon("icon" = mark_style.icon, "icon_state" = "[mark_style.icon_state]-[organ_tag]")

			if(organ_tag == BP_L_LEG)
				mark_splice = new/icon(mark_style.icon, "[mark_style.icon_state]-l_foot")
			else if(organ_tag == BP_R_LEG)
				mark_splice = new/icon(mark_style.icon, "[mark_style.icon_state]-r_foot")
			else if(organ_tag == BP_L_ARM)
				mark_splice = new/icon(mark_style.icon, "[mark_style.icon_state]-l_hand")
			else if(organ_tag == BP_R_ARM)
				mark_splice = new/icon(mark_style.icon, "[mark_style.icon_state]-r_hand")

			if(mark_splice && mark_s)
				mark_s.Blend(mark_splice, ICON_OVERLAY)

			mark_s.Blend(markings[M]["color"], mark_style.color_blend_mode)
			add_overlay(mark_s) //So when it's not on your body, it has icons
			mob_icon.Blend(mark_s, ICON_OVERLAY) //So when it's on your body, it has icons
	// EQUINOX EDIT END

	dir = EAST
	icon = mob_icon

/obj/item/organ/external/proc/get_icon()
	update_icon()
	return mob_icon
