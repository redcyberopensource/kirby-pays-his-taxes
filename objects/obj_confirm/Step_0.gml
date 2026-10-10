image_index = option;

//Scroll
if (keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl))
{
	option -= 1
}

if (keyboard_check_pressed(vk_right)|| gamepad_button_check_pressed(0, gp_padr))
{
	option += 1
}

if (option > 1)
{
	option = 0
}

if (option < 0)
{
	option = 1
}

if (keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1))
{
	if (option = 0)
	{
		if instance_exists(obj_file_select_new)
		{
			with (obj_file_select_new)
			{
				switch (option)
				{
					case 0:
						file_delete("save1.txt")
					break;
			
					case 1:
						file_delete("save2.txt")
					break;
			
					case 2:
						file_delete("save3.txt")
					break;
				}
			}
			//Reset Variables
			game_reset();
			
			room_goto(rm_hub_1)
		}
	}
	else if (option = 1)
	{
		instance_destroy()
		with obj_file_select_new alarm[0] = 5
	}
}