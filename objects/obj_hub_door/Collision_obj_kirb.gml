if (keyboard_check(vk_up) || gamepad_button_check(0, gp_padu)) && (!locked)
{
	room_goto(rm_door)
}