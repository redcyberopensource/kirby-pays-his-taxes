// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function settings_load(){
	ini_open("settings.ini")
	
	global.can_play_music = (ini_read_real("Settings", "Can_Play_Music", true))
	
	global.volume = clamp(floor(ini_read_real("Settings","Volume",100)),0,100);
	audio_master_gain(global.volume/100)
	
	global.fullscreen = ini_read_real("Settings","Fullscreen", false);
	window_set_fullscreen(global.fullscreen)
	
	global.vscync = (ini_read_real("Settings", "Vsync", false))
	if (global.vscync) set_vsync()
	
	global.window_size = (ini_read_real("Settings", "Window_Size", 2));
	
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
	
	global.float_hold = (ini_read_real("Settings", "Hold_to_float", false));
	
	ini_close()
	
	settings_save()
}