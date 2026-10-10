if (keys >= required_keys)
{
	image_index = 1
	
	if (place_meeting(x, y, obj_kirb)) && (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu))
	{
		room_goto(rm_door)
	}
}