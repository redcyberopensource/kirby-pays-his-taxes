rot_x += 1;
rot_y += 0.7;
rot_z += 0.3;

if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_start))
{
	room_goto_next()
}