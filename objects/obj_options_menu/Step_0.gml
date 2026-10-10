//select
up_key = (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu))
down_key = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd)
key_left_pressed = keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl)
key_right_pressed = keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr)
key_left = keyboard_check(vk_left) || gamepad_button_check(0, gp_padl)
key_right = keyboard_check(vk_right) || gamepad_button_check(0, gp_padr)
key_accept = (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1))

pos += down_key - up_key;

if (pos >= op_length)
{
	pos = 0
}

if (pos < 0)
{
	pos = op_length-1
}

//choosing
switch (pos)
{
	case 0:
		if (key_accept) || (key_left_pressed) || (key_right_pressed)
		{
			global.can_play_music = !global.can_play_music
			audio_toggle_bgm(global.current_music)
		}
	break;
	
	case 1:
		if (key_left) && (global.volume > 0)
		{
			global.volume -= 1
			audio_master_gain(global.volume/100)
		}
		else if (key_right) && (global.volume < 100)
		{
			global.volume += 1
			audio_master_gain(global.volume/100)
		}
	break;
	
	case 2:
		if (key_accept) || (key_left_pressed) || (key_right_pressed)
		{
			global.fullscreen = !global.fullscreen
			window_set_fullscreen(global.fullscreen)
		}
	break;
	
	case 3:
		if (key_accept) || (key_left_pressed) || (key_right_pressed)
		{
			global.vscync = !global.vscync
			display_reset(0,global.vscync);
		}
	break;
	
	case 4:
		if (key_left_pressed) && (global.window_size > 1)
		{
			global.window_size -= 1;
		}
		else if (key_right_pressed) && (global.window_size < 3)
		{
			global.window_size += 1;
		}
	break;
	
	case 5:
		if (key_accept) || (key_left_pressed) || (key_right_pressed)
		{
			global.float_hold = !global.float_hold;
		}
	break;
	
	case 6:
		if (key_accept)
		{
			room_goto(rm_file_select_delete)
		}
	break;
}

switch (global.window_size)
{
	case 1:
		window_set_size(640,480);
	break;
	
	case 2:
		window_set_size(960,720);
	break;
	
	case 3:
		window_set_size(1440,1080);
	break;
}

if (keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(0, gp_face2))
{
	room_goto(rm_menu);
	settings_save();
}