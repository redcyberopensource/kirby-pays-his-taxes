image_index = option;

//Scroll
if (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu))
{
	option -= 1
}

if (keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd))
{
	option += 1
}

if (option > 2)
{
	option = 0
}

if (option < 0)
{
	option = 2
}

//Select
if (keyboard_check_pressed(vk_enter)) || (keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1)) && (can_use)
{
	switch (option)
	{
		case 0:
			if (file_exists("save1.txt")) && (!instance_exists(obj_confirm))
			{
				can_use = false
				instance_create_depth(x, y, -2, obj_confirm)
			}
			else
			{
				global.file = "save1.txt"
				game_reset()
				room_goto(rm_hub_1);
			}
		break;
		
		case 1:
			if (file_exists("save2.txt"))
			{
				can_use = false;
				instance_create_depth(x, y, -2, obj_confirm)
			}
			else
			{
				global.file = "save2.txt"
				game_reset()
				room_goto(rm_hub_1);
			}
		break;
		
		case 2:
			if (file_exists("save3.txt"))
			{
				can_use = false;
				instance_create_depth(x, y, -2, obj_confirm)
			}
			else
			{
				global.file = "save3.txt"
				game_reset();
				room_goto(rm_hub_1);
			}
		break;
	}
}

if (keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(0, gp_face2))
{
	room_goto(rm_menu);
}