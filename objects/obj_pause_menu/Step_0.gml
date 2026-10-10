image_index = option

if (keyboard_check(vk_left) || gamepad_button_check(0, gp_padl))
{
	option = 0;
}
else if (keyboard_check(vk_right) || gamepad_button_check(0, gp_padr))
{
	option = 1;
}

switch (option)
{
	case 0:
		if (keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1))
		{
			instance_activate_all()
			with obj_pause
			{
				paused = false;
			}
			instance_destroy();
		}
	break;
	
	case 1:
		if (keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1))
		{
			instance_activate_all()
			with obj_pause paused = false
			room_goto(rm_hub_1)
		}
	break;
}