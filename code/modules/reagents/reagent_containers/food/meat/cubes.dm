//cubed animals!

/obj/item/chems/food/monkeycube
	name = "monkey cube"
	desc = "Just add water!"
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	icon_state = "monkeycube"
	bitesize = 12
	filling_color = "#adac7f"
	center_of_mass = @'{"x":16,"y":14}'

	var/growing = FALSE
	var/monkey_type = /mob/living/human/monkey
	var/wrapper_type

/obj/item/chems/food/monkeycube/populate_reagents()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 10)

/obj/item/chems/food/monkeycube/get_single_monetary_worth()
	//. = (monkey_type ? round(atom_info_repository.get_combined_worth_for(monkey_type) * 1.25) : 5)
	. = (monkey_type ? round(atom_info_repository.get_combined_worth_for((islist(monkey_type) ? monkey_type[1] : monkey_type)) * 1.25) : 5)
	if(wrapper_type)
		. += atom_info_repository.get_combined_worth_for(wrapper_type)

/obj/item/chems/food/monkeycube/attack_self(var/mob/user)
	if(wrapper_type)
		Unwrap(user)

/obj/item/chems/food/monkeycube/proc/Expand(force_loc)
	if(!growing)
		growing = TRUE
		visible_message(SPAN_NOTICE("\The [src] expands!"))
		var/mob/monkey = islist(monkey_type) ? pickweight(monkey_type) : monkey_type
		monkey = new monkey
		monkey.dropInto(force_loc || loc)
		qdel(src)

/obj/item/chems/food/monkeycube/proc/Unwrap(var/mob/user)
	icon_state = "monkeycube"
	desc = "Just add water!"
	to_chat(user, SPAN_NOTICE("You unwrap \the [src]."))
	atom_flags |= ATOM_FLAG_OPEN_CONTAINER
	user.put_in_hands(new wrapper_type(get_turf(user)))
	wrapper_type = null

/obj/item/chems/food/monkeycube/handle_eaten_by_mob(mob/user, mob/target)
	. = ..()
	if(. == EATEN_SUCCESS)
		target = target || user
		if(target)
			target.visible_message(SPAN_DANGER("A screeching creature bursts out of \the [target]!"))
			var/obj/item/organ/external/organ = GET_EXTERNAL_ORGAN(target, BP_CHEST)
			if(organ)
				organ.take_external_damage(50, 0, 0, "Animal escaping the ribcage")
		Expand(get_turf(target))

/obj/item/chems/food/monkeycube/on_reagent_change()
	if((. = ..()) && !QDELETED(src) && reagents?.has_reagent(/decl/material/liquid/water))
		Expand()

/obj/item/chems/food/monkeycube/wrapped
	desc = "Still wrapped in some paper."
	icon_state = "monkeycubewrap"
	item_flags = 0
	obj_flags = 0
	wrapper_type = /obj/item/trash/cubewrapper

//Spider cubes, all that's left of the cube PR
/obj/item/chems/food/monkeycube/spidercube
	name = "spider cube"
	monkey_type = /obj/effect/spider/spiderling

/obj/item/chems/food/monkeycube/wrapped/spidercube
	name = "spider cube"
	monkey_type = /obj/effect/spider/spiderling

//Carp cubes
/obj/item/chems/food/monkeycube/carpcube
	name = "carp cube"
	monkey_type = list(/mob/living/simple_animal/hostile/carp = 10, /mob/living/simple_animal/hostile/carp/pike = 3, /mob/living/simple_animal/hostile/carp/shark = 1)

/obj/item/chems/food/monkeycube/wrapped/carpcube
	name = "carp cube"
	monkey_type = list(/mob/living/simple_animal/hostile/carp = 10, /mob/living/simple_animal/hostile/carp/pike = 3, /mob/living/simple_animal/hostile/carp/shark = 1)