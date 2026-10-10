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
if (keyboard_check_pressed(vk_enter)) || (keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1))
{
	switch (option)
	{
		case 0:
			if (file_exists("save1.txt"))
			{
				file_delete("save1.txt")
				show_message("File deleted")
			}
			else
			{
				show_message("File Not found")
			}
			game_reset();
		break;
		
		case 1:
			if (file_exists("save2.txt"))
			{
				file_delete("save2.txt")
				show_message("File deleted")
			}
			else
			{
				show_message("File Not found")
			}
			game_reset();
		break;
		
		case 2:
			if (file_exists("save3.txt"))
			{
				file_delete("save2.txt")
				show_message("File deleted")
			}
			else
			{
				show_message("File Not found")
			}
			game_reset();
		break;
	}
}

if (keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(0, gp_face2))
{
	room_goto(rm_options);
}