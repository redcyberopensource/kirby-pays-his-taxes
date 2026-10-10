image_index = option

if (instance_exists(obj_game_hud))
{
	with obj_game_hud instance_destroy()
}

if (keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl)) && (option > 0)
{
	option -= 1
}
else if (keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr)) && (option < 1)
{
	option += 1
}

if (keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1))
{
	switch (option)
	{
		case 0:
			room_goto(global.hub_room)
		break;
		
		case 1:
			room_goto(rm_menu)
		break;
	}
}

if (global.lives < 0)
{
	global.lives = 3
}