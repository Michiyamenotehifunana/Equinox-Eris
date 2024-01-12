var/global/list/valid_bloodtypes = list("A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-")

/datum/preferences
	var/species = SPECIES_HUMAN

	var/b_type = "A+"					//blood type (not-chooseable)

	var/s_base = ""						//Base skin colour
	var/s_tone = 0						//Skin tone

	var/h_style = "Bald"				//Hair type
	var/f_style = "Shaved"				//Face hair type

	var/hair_color = "#000000"			//Hair color
	var/facial_color = "#000000"		//Face hair color
	var/skin_color = "#000000"			//Skin color
	var/eyes_color = "#000000"			//Eye color

	var/disabilities = 0

	var/equip_preview_mob = EQUIP_PREVIEW_ALL

	var/icon/bgstate = "black"
	var/list/bgstate_options = list("steel", "dark_steel", "white_tiles", "black_tiles", "wood", "carpet", "white", "black")

//EQUINOX EDIT START - furry - Define the vars that will be saved in the savefiles
	var/list/body_markings = list()
	var/ear_style		// Type of selected ear style
	var/ears_color = "#000000"		// Ear color.
	var/ears_color2 = "#000000"	// Ear extra color.
	var/tail_style		// Type of selected tail style
	var/tail_color = "#000000"		// Tail/Taur color
	var/tail_color2 = "#000000" 	// For extra overlay.
	var/wing_style		// Type of selected wing style
	var/wing_color = "#000000"		// Wing color
	var/size_multiplier = 1.00
	var/dress_mob = TRUE
	var/fuzzy = FALSE
	var/custom_species
//EQUINOX EDIT END - furry
/datum/category_item/player_setup_item/physical/body
	name = "Body"
	sort_order = 2
	var/hide_species = TRUE

/datum/category_item/player_setup_item/physical/body/load_character(var/savefile/S)
	from_file(S["species"], pref.species)
	from_file(S["skin_tone"], pref.s_tone)
	from_file(S["skin_base"], pref.s_base)
	from_file(S["hair_style_name"], pref.h_style)
	from_file(S["facial_style_name"], pref.f_style)
	from_file(S["b_type"], pref.b_type)
	from_file(S["disabilities"], pref.disabilities)
	pref.preview_icon = null
	from_file(S["bgstate"], pref.bgstate)
	from_file(S["eyes_color"], pref.eyes_color)
	from_file(S["skin_color"], pref.skin_color)
	from_file(S["hair_color"], pref.hair_color)
	from_file(S["facial_color"], pref.facial_color)
//EQUINOX EDIT START - furry - The actual loading of preferences from savefile, modernized
	from_file(S["ear_style"], pref.ear_style)
	from_file(S["ears_color"], pref.ears_color)
	from_file(S["ears_color2"], pref.ears_color2)
	from_file(S["tail_style"], pref.tail_style)
	from_file(S["tail_color"], pref.tail_color)
	from_file(S["tail_color2"], pref.tail_color2)
	from_file(S["wing_style"], pref.wing_style)
	from_file(S["wing_color"], pref.wing_color)
	from_file(S["custom_species"], pref.custom_species)
	from_file(S["size_multiplier"], pref.size_multiplier)
	from_file(S["fuzzy"], pref.fuzzy)
	from_file(S["body_markings"], pref.body_markings)
//EQUINOX EDIT END - furry

/datum/category_item/player_setup_item/physical/body/save_character(var/savefile/S)
	to_file(S["species"], pref.species)
	to_file(S["skin_tone"], pref.s_tone)
	to_file(S["skin_base"], pref.s_base)
	to_file(S["hair_style_name"],pref.h_style)
	to_file(S["facial_style_name"],pref.f_style)
	to_file(S["b_type"], pref.b_type)
	to_file(S["disabilities"], pref.disabilities)
	to_file(S["bgstate"], pref.bgstate)
	to_file(S["eyes_color"], pref.eyes_color)
	to_file(S["skin_color"], pref.skin_color)
	to_file(S["hair_color"], pref.hair_color)
	to_file(S["facial_color"], pref.facial_color)
//EQUINOX EDIT START - furry
	to_file(S["ear_style"], pref.ear_style)
	to_file(S["ears_color"], pref.ears_color)
	to_file(S["ears_color2"], pref.ears_color2)
	to_file(S["tail_style"], pref.tail_style)
	to_file(S["tail_color"], pref.tail_color)
	to_file(S["tail_color2"], pref.tail_color2)
	to_file(S["wing_style"], pref.wing_style)
	to_file(S["wing_color"], pref.wing_color)
	to_file(S["custom_species"], pref.custom_species)
	to_file(S["size_multiplier"], pref.size_multiplier)
	to_file(S["fuzzy"], pref.fuzzy)
	to_file(S["body_markings"], pref.body_markings)
//EQUINOX EDIT END - furry

/datum/category_item/player_setup_item/physical/body/sanitize_character(var/savefile/S)
	pref.h_style		= sanitize_inlist(pref.h_style, GLOB.hair_styles_list, initial(pref.h_style))
	pref.f_style		= sanitize_inlist(pref.f_style, GLOB.facial_hair_styles_list, initial(pref.f_style))
	pref.b_type			= sanitize_text(pref.b_type, initial(pref.b_type))
	pref.hair_color		= iscolor(pref.hair_color) ? pref.hair_color : "#000000"
	pref.facial_color	= iscolor(pref.facial_color) ? pref.facial_color : "#000000"
	pref.skin_color		= iscolor(pref.skin_color) ? pref.skin_color : "#000000"
	pref.eyes_color		= iscolor(pref.eyes_color) ? pref.eyes_color : "#000000"
//EQUINOX EDIT START - furry
	pref.ears_color		= iscolor(pref.ears_color) ? pref.ears_color : "#000000"
	pref.ears_color2		= iscolor(pref.ears_color2) ? pref.ears_color2 : "#000000"
	pref.tail_color		= iscolor(pref.tail_color) ? pref.tail_color : "#000000"
	pref.tail_color2		= iscolor(pref.tail_color2) ? pref.tail_color2 : "#000000"
	pref.wing_color		= iscolor(pref.wing_color) ? pref.wing_color : "#000000"
	if(pref.ear_style)
		pref.ear_style	= sanitize_inlist(pref.ear_style, GLOB.ear_styles_list, initial(pref.ear_style))
	if(pref.tail_style)
		pref.tail_style	= sanitize_inlist(pref.tail_style, GLOB.tail_styles_list, initial(pref.tail_style))
	if(pref.wing_style)
		pref.wing_style	= sanitize_inlist(pref.wing_style, GLOB.wing_styles_list, initial(pref.wing_style))

	if(pref.size_multiplier == null || pref.size_multiplier < 0.80 || pref.size_multiplier > 1.20)
		pref.size_multiplier = initial(pref.size_multiplier)

	pref.fuzzy				= sanitize_bool(pref.fuzzy, initial(pref.fuzzy))

	if(!pref.species || !(pref.species in playable_species))
		pref.species = SPECIES_HUMAN

	if(!pref.body_markings)
		pref.body_markings = list()
	else
		pref.body_markings &= GLOB.body_marking_styles_list
//EQUINOX EDIT END - furry

	sanitize_integer(pref.s_tone, -185, 34, initial(pref.s_tone))

	pref.s_base = ""

	pref.disabilities	= sanitize_integer(pref.disabilities, 0, 65535, initial(pref.disabilities))

	if(!pref.bgstate || !(pref.bgstate in pref.bgstate_options))
		pref.bgstate = "black"

/datum/category_item/player_setup_item/physical/body/content(var/mob/user)
	if(!pref.preview_icon)
		pref.update_preview_icon()
	user << browse_rsc(pref.preview_icon, "previewicon.png")

	var/datum/species/mob_species = all_species[pref.species]
//EQUINOX EDIT START - furry
	var/title = "<b>Species<a href='?src=\ref[src];show_species=1'><small>?</small></a>:</b> <a href='?src=\ref[src];set_species=1'>[mob_species.name]</a>"
	var/append_text = "<a href='?src=\ref[src];toggle_species_verbose=1'>[hide_species ? "Expand" : "Collapse"]</a>"
	. += mob_species.get_description(title, append_text, verbose = !hide_species, skip_detail = TRUE, skip_photo = TRUE)
//EQUINOX EDIT END - furry

	. += "<style>span.color_holder_box{display: inline-block; width: 20px; height: 8px; border:1px solid #000; padding: 0px;}</style>"
	. += "<hr>"
	. += "<table><tr style='vertical-align:top; width: 100%'><td width=65%><b>Body</b> "
	. += "(<a href='?src=\ref[src];random=1'>&reg;</A>)"
	. += "<br>"

	. += "Blood Type: <a href='?src=\ref[src];blood_type=1'>[pref.b_type]</a><br>"

	//. += "Base Colour: <a href='?src=\ref[src];base_skin=1'>[pref.s_base]</a><br>"

//EQUINOX EDIT START - furry
	if(has_flag(mob_species, HAS_SKIN_COLOR))
		. += "<br><b>Body Color: </b>"
		. += "<a href='?src=\ref[src];skin_color=1'><span class='color_holder_box' style='background-color:[pref.skin_color]'></span></a><br>"

	if(has_flag(mob_species, HAS_SKIN_TONE))
		. += "Skin Tone: <a href='?src=\ref[src];skin_tone=1'>[-pref.s_tone + 35]/220</a><br>"
//EQUINOX EDIT END - furry

	. += "Needs Glasses: <a href='?src=\ref[src];disabilities=[NEARSIGHTED]'><b>[pref.disabilities & NEARSIGHTED ? "Yes" : "No"]</b></a><br><br>"

	. += "<b>Hair:</b><br>"
	. += " Style: <a href='?src=\ref[src];cycle_hair=right'>&lt;&lt;</a><a href='?src=\ref[src];cycle_hair=left'>&gt;&gt;</a><a href='?src=\ref[src];hair_style=1'>[pref.h_style]</a>"
	if(has_flag(mob_species, HAS_HAIR_COLOR))
		. += "<a href='?src=\ref[src];hair_color=1'><span class='color_holder_box' style='background-color:[pref.hair_color]'></span></a><br>"

	. += "<br><b>Facial:</b><br>"
	. += " Style: <a href='?src=\ref[src];cycle_facial_hair=right'>&lt;&lt;</a><a href='?src=\ref[src];cycle_facial_hair=left'>&gt;&gt;</a><a href='?src=\ref[src];facial_style=1'>[pref.f_style]</a>"
	if(has_flag(mob_species, HAS_HAIR_COLOR))
		. += "<a href='?src=\ref[src];facial_color=1'><span class='color_holder_box' style='background-color:[pref.facial_color]'></span></a><br>"

	if(has_flag(mob_species, HAS_EYE_COLOR))
		. += "<br><b>Eyes: </b>"
		. += "<a href='?src=\ref[src];eye_color=1'><span class='color_holder_box' style='background-color:[pref.eyes_color]'></span></a><br>"


	. += "</td><td style = 'text-align:center;' width = 35%><b>Preview</b><br>"
	. += "<div style ='padding-bottom:-2px;' class='statusDisplay'><img src=previewicon.png width=[pref.preview_icon.Width()] height=[pref.preview_icon.Height()]></div>"
	. += "<br><a href='?src=\ref[src];cycle_bg=1'>Cycle background</a>"
	. += "<br><a href='?src=\ref[src];toggle_preview_value=[EQUIP_PREVIEW_LOADOUT]'>[pref.equip_preview_mob & EQUIP_PREVIEW_LOADOUT ? "Hide loadout" : "Show loadout"]</a>"
	. += "<br><a href='?src=\ref[src];toggle_preview_value=[EQUIP_PREVIEW_JOB]'>[pref.equip_preview_mob & EQUIP_PREVIEW_JOB ? "Hide job gear" : "Show job gear"]</a>"
	. += "</td></tr></table>"

//EQUINOX EDIT START - furry
	. += "<br>"
	. += "<div style='clear: both;'"
	. += "<b>Extra Appearance:</b><br>"

	. += "<b>Custom Species Name</b> "
	. += "<a href='?src=\ref[src];custom_species=1'>[pref.custom_species ? pref.custom_species : "-Input Name-"]</a><br>"

	. += "<br><a href='?src=\ref[src];marking_style=1'>Body Markings +</a><br>"
	for(var/M in pref.body_markings)
		. += "[M] [pref.body_markings.len > 1 ? "<a href='?src=\ref[src];marking_up=[M]'>&#708;</a> <a href='?src=\ref[src];marking_down=[M]'>&#709;</a> " : ""]<a href='?src=\ref[src];marking_remove=[M]'>-</a> <a href='?src=\ref[src];marking_color=[M]'>Color</a>"
		. += "<font face='fixedsys' size='3' color='[pref.body_markings[M]]'><table style='display:inline;' bgcolor='[pref.body_markings[M]]'><tr><td>__</td></tr></table></font>"
		. += "<br><br>"

	. += "<br>"
	. += "<b>Scale:</b> <a href='?src=\ref[src];size_multiplier=1'>[round(pref.size_multiplier*100)]%</a><br>"
	. += "<b>Scaled Appearance:</b> <a [pref.fuzzy ? "" : ""] href='?src=\ref[src];toggle_fuzzy=1'><b>[pref.fuzzy ? "Fuzzy" : "Sharp"]</b></a><br>"
	. += "<br>"

	var/ear_display = "Normal"
	if(pref.ear_style && (pref.ear_style in GLOB.ear_styles_list))
		var/datum/sprite_accessory/ears/instance = GLOB.ear_styles_list[pref.ear_style]
		ear_display = instance.name

	else if(pref.ear_style)
		ear_display = "REQUIRES UPDATE"
	. += "<b>Ears</b><br>"
	. += " Style: <a href='?src=\ref[src];ear_style=1'>[ear_display]</a><br>"
	if(GLOB.ear_styles_list[pref.ear_style])
		var/datum/sprite_accessory/ears/ear = GLOB.ear_styles_list[pref.ear_style]
		if (ear.do_colouration)
			. += "<a href='?src=\ref[src];ear_color=1'>Change Color</a> <font face='fixedsys' size='3' color='[pref.ears_color]'><table style='display:inline;' bgcolor='[pref.ears_color]'><tr><td>__</td></tr></table> </font><br>"
		if (ear.extra_overlay)
			. += "<a href='?src=\ref[src];ear_color2=1'>Change Secondary Color</a> <font face='fixedsys' size='3' color='[pref.ears_color2]'><table style='display:inline;' bgcolor='[pref.ears_color2]'><tr><td>__</td></tr></table> </font><br>"

	var/tail_display = "Normal"
	if(pref.tail_style && (pref.tail_style in GLOB.tail_styles_list))
		var/datum/sprite_accessory/tail/instance = GLOB.tail_styles_list[pref.tail_style]
		tail_display = instance.name
	else if(pref.tail_style)
		tail_display = "REQUIRES UPDATE"
	. += "<b>Tail</b><br>"
	. += " Style: <a href='?src=\ref[src];tail_style=1'>[tail_display]</a><br>"

	if(GLOB.tail_styles_list[pref.tail_style])
		var/datum/sprite_accessory/tail/T = GLOB.tail_styles_list[pref.tail_style]
		if (T.do_colouration)
			. += "<a href='?src=\ref[src];tail_color=1'>Change Color</a> <font face='fixedsys' size='3' color='[pref.tail_color]'><table style='display:inline;' bgcolor='[pref.tail_color]'><tr><td>__</td></tr></table> </font><br>"
		if (T.extra_overlay)
			. += "<a href='?src=\ref[src];tail_color2=1'>Change Secondary Color</a> <font face='fixedsys' size='3' color='[pref.tail_color2]'><table style='display:inline;' bgcolor='[pref.tail_color2]'><tr><td>__</td></tr></table> </font><br>"

	var/wing_display = "Normal"
	if(pref.wing_style && (pref.wing_style in GLOB.wing_styles_list))
		var/datum/sprite_accessory/wing/instance = GLOB.wing_styles_list[pref.wing_style]
		wing_display = instance.name
	else if(pref.wing_style)
		wing_display = "REQUIRES UPDATE"
	. += "<b>Wing</b><br>"
	. += " Style: <a href='?src=\ref[src];wing_style=1'>[wing_display]</a><br>"

	if(GLOB.wing_styles_list[pref.wing_style])
		var/datum/sprite_accessory/wing/T = GLOB.wing_styles_list[pref.wing_style]
		if (T.do_colouration)
			. += "<a href='?src=\ref[src];wing_color=1'>Change Color</a> <font face='fixedsys' size='3' color='[pref.wing_color]'><table style='display:inline;' bgcolor='[pref.wing_color]'><tr><td>__</td></tr></table> </font><br>"

//EQUINOX EDIT END - furry - The actual interface bits

/datum/category_item/player_setup_item/physical/body/proc/has_flag(var/datum/species/mob_species, var/flag)
	return mob_species && (mob_species.appearance_flags & flag)

/datum/category_item/player_setup_item/physical/body/OnTopic(var/href,var/list/href_list, var/mob/user)

	var/datum/species/mob_species = all_species[pref.species]
	if(href_list["toggle_species_verbose"])
		hide_species = !hide_species
		return TOPIC_REFRESH

	else if(href_list["random"])
		pref.randomize_appearance_and_body_for()
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["blood_type"])
		var/new_b_type = input(user, "Choose your character's blood-type:", CHARACTER_PREFERENCE_INPUT_TITLE) as null|anything in valid_bloodtypes
		if(new_b_type && CanUseTopic(user))
			pref.b_type = new_b_type
			return TOPIC_REFRESH

	else if(href_list["hair_color"])
		if(!has_flag(mob_species, HAS_HAIR_COLOR))
			return TOPIC_NOACTION
		var/new_hair = input(user, "Choose your character's hair colour:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.hair_color) as color|null
		if(new_hair && has_flag(all_species[pref.species], HAS_HAIR_COLOR) && CanUseTopic(user))
			pref.hair_color = new_hair
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["hair_style"])
		var/list/valid_hairstyles = mob_species.get_hair_styles()
		var/new_h_style = input(user, "Choose your character's hair style:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.h_style)  as null|anything in valid_hairstyles

		mob_species = all_species[pref.species]
		if(new_h_style && CanUseTopic(user) && (new_h_style in mob_species.get_hair_styles()))
			pref.h_style = new_h_style
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["facial_color"])
		if(!has_flag(mob_species, HAS_HAIR_COLOR))
			return TOPIC_NOACTION
		var/new_facial = input(user, "Choose your character's facial-hair colour:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.facial_color) as color|null
		if(new_facial && has_flag(all_species[pref.species], HAS_HAIR_COLOR) && CanUseTopic(user))
			pref.facial_color = new_facial
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["eye_color"])
		if(!has_flag(mob_species, HAS_EYE_COLOR))
			return TOPIC_NOACTION
		var/new_eyes = input(user, "Choose your character's eye colour:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.eyes_color) as color|null
		if(new_eyes && has_flag(all_species[pref.species], HAS_EYE_COLOR) && CanUseTopic(user))
			pref.eyes_color = new_eyes
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["base_skin"])
		var/new_s_base = input(user, "Choose your character's base colour:", CHARACTER_PREFERENCE_INPUT_TITLE) as null
		if(new_s_base && CanUseTopic(user))
			pref.s_base = new_s_base
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["skin_tone"])
		var/new_s_tone = input(user, "Choose your character's skin-tone. Lower numbers are lighter, higher are darker. Range: 1 to 225", CHARACTER_PREFERENCE_INPUT_TITLE, (-pref.s_tone) + 35) as num|null

		mob_species = all_species[pref.species]
		if(new_s_tone && CanUseTopic(user))
			pref.s_tone = 35 - max(min(round(new_s_tone), 220), 1)
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["skin_color"])
		if(!has_flag(mob_species, HAS_SKIN_COLOR))
			return TOPIC_NOACTION
		var/new_skin = input(user, "Choose your character's skin colour: ", CHARACTER_PREFERENCE_INPUT_TITLE, pref.skin_color) as color|null
		if(new_skin && has_flag(all_species[pref.species], HAS_SKIN_COLOR) && CanUseTopic(user))
			pref.skin_color = new_skin
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["facial_style"])
		var/list/valid_facialhairstyles = mob_species.get_facial_hair_styles(pref.gender)

		var/new_f_style = input(user, "Choose your character's facial-hair style:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.f_style)  as null|anything in valid_facialhairstyles

		mob_species = all_species[pref.species]
		if(new_f_style && CanUseTopic(user) && mob_species.get_facial_hair_styles(pref.gender))
			pref.f_style = new_f_style
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["disabilities"])
		var/disability_flag = text2num(href_list["disabilities"])
		pref.disabilities ^= disability_flag
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["toggle_preview_value"])
		pref.equip_preview_mob ^= text2num(href_list["toggle_preview_value"])
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["cycle_bg"])
		pref.bgstate = next_list_item(pref.bgstate, pref.bgstate_options)
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["cycle_hair"])
		var/list/valid_hairstyles = mob_species.get_hair_styles()
		var/old_pos = valid_hairstyles.Find(pref.h_style)
		var/new_h_style
		if(href_list["cycle_hair"] == "right")
			if(old_pos - 1 < 1)
				return TOPIC_NOACTION
			new_h_style = valid_hairstyles[old_pos-1]
		else
			if(old_pos + 1 > valid_hairstyles.len)
				return TOPIC_NOACTION
			new_h_style = valid_hairstyles[old_pos+1]

		mob_species = all_species[pref.species]
		if(new_h_style && CanUseTopic(user) && (new_h_style in mob_species.get_hair_styles()))
			pref.h_style = new_h_style
			return TOPIC_REFRESH_UPDATE_PREVIEW
	else if(href_list["cycle_facial_hair"])
		var/list/valid_facialhairstyles = mob_species.get_facial_hair_styles(pref.gender)
		var/old_pos = valid_facialhairstyles.Find(pref.f_style)
		var/new_f_style
		if(href_list["cycle_facial_hair"] == "right")
			if(old_pos - 1 < 1)
				return TOPIC_NOACTION
			new_f_style = valid_facialhairstyles[old_pos-1]
		else
			if(old_pos + 1 > valid_facialhairstyles.len)
				return TOPIC_NOACTION
			new_f_style = valid_facialhairstyles[old_pos+1]
		mob_species = all_species[pref.species]
		if(new_f_style && CanUseTopic(user) && mob_species.get_facial_hair_styles(pref.gender))
			pref.f_style = new_f_style
			return TOPIC_REFRESH_UPDATE_PREVIEW

//EQUINOX EDIT START - furry - The stuff that makes the interface stuff actually do things

	else if(href_list["ear_style"])
		// Construct the list of names allowed for this user.
		var/list/pretty_ear_styles = list("Normal" = null)
		for(var/path in GLOB.ear_styles_list)
			var/datum/sprite_accessory/ears/instance = GLOB.ear_styles_list[path]
			if((!instance.ckeys_allowed) || (usr.ckey in instance.ckeys_allowed))
				pretty_ear_styles[instance.name] = path

		// Present choice to user
		var/new_ear_style = input(user, "Pick ears", "Character Preference", pref.ear_style) as null|anything in pretty_ear_styles
		if(new_ear_style)
			pref.ear_style = pretty_ear_styles[new_ear_style]

		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["ear_color"])
		var/new_earc = input(user, "Choose your character's ear colour:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.ears_color) as color|null
		if(new_earc)
			pref.ears_color = new_earc
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["ear_color2"])
		var/new_earc2 = input(user, "Choose your character's secondary ear colour:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.ears_color2) as color|null
		if(new_earc2)
			pref.ears_color2 = new_earc2
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["tail_style"])
		// Construct the list of names allowed for this user.
		var/list/pretty_tail_styles = list("Normal" = null)
		for(var/path in GLOB.tail_styles_list)
			var/datum/sprite_accessory/tail/instance = GLOB.tail_styles_list[path]
			if((!instance.ckeys_allowed) || (user.ckey in instance.ckeys_allowed))
				pretty_tail_styles[instance.name] = path

		// Present choice to user
		var/new_tail_style = input(user, "Pick tails", "Character Preference", pref.tail_style) as null|anything in pretty_tail_styles
		if(new_tail_style)
			pref.tail_style = pretty_tail_styles[new_tail_style]

		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["tail_color"])
		var/new_tailc = input(user, "Choose your character's tail/taur colour:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.tail_color) as color|null
		if(new_tailc)
			pref.tail_color = new_tailc
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["tail_color2"])
		var/new_tailc2 = input(user, "Choose your character's secondary tail/taur colour:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.tail_color2) as color|null
		if(new_tailc2)
			pref.tail_color2 = new_tailc2
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["wing_style"])
		// Construct the list of names allowed for this user.
		var/list/pretty_wing_styles = list("Normal" = null)
		for(var/path in GLOB.wing_styles_list)
			var/datum/sprite_accessory/wing/instance = GLOB.wing_styles_list[path]
			if((!instance.ckeys_allowed) || (user.ckey in instance.ckeys_allowed))
				pretty_wing_styles[instance.name] = path

		// Present choice to user
		var/new_wing_style = input(user, "Pick wings", "Character Preference", pref.wing_style) as null|anything in pretty_wing_styles
		if(new_wing_style)
			pref.wing_style = pretty_wing_styles[new_wing_style]

		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["wing_color"])
		var/new_wingc = input(user, "Choose your character's wing colour:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.wing_color) as color|null
		if(new_wingc)
			pref.wing_color = new_wingc
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["toggle_clothing"])
		pref.dress_mob = !pref.dress_mob
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["custom_species"])
		var/raw_choice = sanitize(input(user, "Input your custom species name:",
			"Character Preference", pref.custom_species) as null|text, MAX_NAME_LEN)
		if (CanUseTopic(user))
			pref.custom_species = raw_choice
		return TOPIC_REFRESH

	else if(href_list["size_multiplier"])
		var/new_size = input(user, "Choose your character's size, ranging from  80% to 120%", "Set Size") as num|null
		if (!ISINRANGE(new_size, 80, 120))
			pref.size_multiplier = 1
			to_chat(user, "<span class='notice'>Invalid size.</span>")
			return TOPIC_REFRESH_UPDATE_PREVIEW
		else if(new_size)
			pref.size_multiplier = (new_size/100)
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["toggle_fuzzy"])
		pref.fuzzy = pref.fuzzy ? FALSE : TRUE;
		return TOPIC_REFRESH

	else if(href_list["marking_style"])
		var/list/usable_markings = pref.body_markings.Copy() ^ GLOB.body_marking_styles_list.Copy()
		var/new_marking = input(user, "Choose a body marking:", "Character Preference")  as null|anything in usable_markings
		if(new_marking && CanUseTopic(user))
			pref.body_markings[new_marking] = "#000000" //New markings start black
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["marking_up"])
		var/M = href_list["marking_up"]
		var/start = pref.body_markings.Find(M)
		if(start != 1) //If we're not the beginning of the list, swap with the previous element.
			moveElement(pref.body_markings, start, start-1)
		else //But if we ARE, become the final element -ahead- of everything else.
			moveElement(pref.body_markings, start, pref.body_markings.len+1)
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["marking_down"])
		var/M = href_list["marking_down"]
		var/start = pref.body_markings.Find(M)
		if(start != pref.body_markings.len) //If we're not the end of the list, swap with the next element.
			moveElement(pref.body_markings, start, start+2)
		else //But if we ARE, become the first element -behind- everything else.
			moveElement(pref.body_markings, start, 1)
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["marking_remove"])
		var/M = href_list["marking_remove"]
		pref.body_markings -= M
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["marking_color"])
		var/M = href_list["marking_color"]
		var/mark_color = input(user, "Choose the [M] color: ", "Character Preference", pref.body_markings[M]) as color|null
		if(mark_color && CanUseTopic(user))
			pref.body_markings[M] = "[mark_color]"
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["show_species"])
		var/choice = input("Which species would you like to look at?") as null|anything in playable_species
		if(choice)
			var/datum/species/current_species = all_species[choice]
			user << browse(current_species.get_description(), "window=species;size=700x400")
			return TOPIC_HANDLED

	else if(href_list["set_species"])

		var/list/species_to_pick = list()
		for(var/species in playable_species)
			if(!check_rights(R_ADMIN, 0))
				var/datum/species/current_species = all_species[species]
				if(!(current_species.spawn_flags & CAN_JOIN))
					continue
				else if((current_species.spawn_flags & IS_WHITELISTED) && !is_alien_whitelisted(preference_mob(),current_species))
					continue
			species_to_pick += species

		var/choice = input("Select a species to play as.") as null|anything in species_to_pick
		if(!choice || !(choice in all_species))
			return

		var/prev_species = pref.species
		pref.species = choice
		if(prev_species != pref.species)
			mob_species = all_species[pref.species]
			if(!(pref.gender in mob_species.genders))
				pref.gender = mob_species.genders[1]

			ResetAllHair()

			//reset hair colour and skin colour
			pref.hair_color = "#000000"
			pref.s_tone = 0
			pref.age = max(min(pref.age, mob_species.max_age), mob_species.min_age)

//			reset_limbs() // Safety for species with incompatible manufacturers; easier than trying to do it case by case.
			pref.body_markings.Cut() // Basically same as above.//TODO-NESTOR

			return TOPIC_REFRESH_UPDATE_PREVIEW

//EQUINOX EDIT END - furry

	return ..()

/datum/category_item/player_setup_item/proc/ResetAllHair()
	ResetHair()
	ResetFacialHair()

/datum/category_item/player_setup_item/proc/ResetHair()

	var/datum/species/mob_species = all_species[pref.species]
	var/list/valid_hairstyles = mob_species.get_hair_styles()

	if(valid_hairstyles.len)
		pref.h_style = pick(valid_hairstyles)
	else
		//this shouldn't happen
		pref.h_style = GLOB.hair_styles_list["Bald"]

	pref.h_style = GLOB.hair_styles_list["Bald"]

/datum/category_item/player_setup_item/proc/ResetFacialHair()

	var/datum/species/mob_species = all_species[pref.species]
	var/list/valid_facialhairstyles = mob_species.get_facial_hair_styles(pref.gender)

	if(valid_facialhairstyles.len)
		pref.f_style = pick(valid_facialhairstyles)
	else
		//this shouldn't happen
		pref.f_style = GLOB.facial_hair_styles_list["Shaved"]
	pref.f_style = GLOB.facial_hair_styles_list["Shaved"]

