/datum/job/ministation/doctor
	title = "Medical Doctor"
	department_types = list(/decl/department/medical)
	head_position = 0
	supervisors = "the Head Doctor"
	total_positions = 3
	spawn_positions = 4
	alt_titles = list("Chemist","Nurse")
	skill_points = 34
	min_skill = list(
		SKILL_LITERACY  = SKILL_ADEPT,
		SKILL_MEDICAL   = SKILL_EXPERT,
		SKILL_ANATOMY   = SKILL_EXPERT,
		SKILL_CHEMISTRY = SKILL_BASIC,
		SKILL_COMBAT	= SKILL_BASIC
	)
	max_skill = list(
		SKILL_MEDICAL   = SKILL_MAX,
		SKILL_ANATOMY   = SKILL_MAX,
		SKILL_CHEMISTRY = SKILL_MAX
	)
	selection_color = "#013d3b"
	economic_power = 12
	access = list(
		access_medical,
		access_medical_equip,
		access_morgue,
		access_surgery,
		access_chemistry,
		access_virology,
		access_cameras,
		access_maint_tunnels
	)
	minimal_access = list(
		access_medical,
		access_medical_equip,
		access_morgue,
		access_surgery,
		access_virology,
		access_cameras,
		access_maint_tunnels
	)
	outfit_type = /decl/hierarchy/outfit/job/ministation/doctor
	minimal_player_age = 3
	event_categories = list(ASSIGNMENT_MEDICAL)

/datum/job/ministation/doctor/head
	title = "Medical Director"
	head_position = 1
	department_types = list(
		/decl/department/medical,
		/decl/department/command
	)
	supervisors = "the Captain and your own ethics"
	outfit_type = /decl/hierarchy/outfit/job/ministation/doctor/head
	alt_titles = list("Surgeon","Patriarch of Medicine", "Head Doctor")
	total_positions = 1
	spawn_positions = 1
	skill_points = 38
	guestbanned = 1
	must_fill = 1
	not_random_selectable = 1
	selection_color = "#026865"
	req_admin_notify = 1
	economic_power = 15
	hud_icon = "hudheaddoctor"
	access = list(
		access_medical,
		access_medical_equip,
		access_morgue,
		access_bridge,
		access_heads,
		access_engine_equip,
		access_eva,
		access_chemistry,
		access_virology,
		access_cmo,
		access_surgery,
		access_RC_announce,
		access_keycard_auth,
		access_sec_doors,
		access_psychiatrist,
		access_mining,
		access_kitchen,
		access_xenobiology,
		access_robotics,
		access_hydroponics,
		access_maint_tunnels,
		access_external_airlocks,
		access_cameras,
		access_security
	)
	minimal_access = list(
		access_medical,
		access_medical_equip,
		access_morgue,
		access_bridge,
		access_heads,
		access_engine_equip,
		access_eva,
		access_chemistry,
		access_virology,
		access_cmo,
		access_surgery,
		access_RC_announce,
		access_keycard_auth,
		access_sec_doors,
		access_psychiatrist,
		access_mining,
		access_kitchen,
		access_xenobiology,
		access_robotics,
		access_hydroponics,
		access_maint_tunnels,
		access_external_airlocks,
		access_cameras,
		access_security
	)
	minimal_player_age = 14
	ideal_character_age = 50
	event_categories = list(ASSIGNMENT_MEDICAL)
