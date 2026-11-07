ang_radius +=3
kirb_y = ystart+lengthdir_y(15,ang_radius);


kirb_x = lerp(kirb_x, target_x, 0.3); 

if (keyboard_check_pressed(vk_right) && (current_number < max_numbers))
{
	current_number += 1
	target_x += 51
}

if (keyboard_check_pressed(vk_left) && (current_number > 0))
{
	current_number -= 1
	target_x -= 51
}

if (keyboard_check_pressed(vk_down)) && (section = 0)
{
	section = 1;
	number_sprite = spr_world_select_numbers_bonus;
}

if (keyboard_check_pressed(vk_up)) && (section = 1)
{
	section = 0;
	number_sprite = spr_world_select_numbers;
}

if (keyboard_check(ord("Z")))
{
	switch (current_number)
	{
		case 0:
			if (section = 0)
			{
				room_goto(rm_hub_1)
			}
			else if (section = 1)
			{
				room_goto(rm_hub_b1)
			}
		break;
	}
}