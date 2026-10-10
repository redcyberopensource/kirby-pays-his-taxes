// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function settings_save(){
	ini_open("settings.ini")
	
	ini_write_real("Settings", "Can_Play_Music", global.can_play_music)
	ini_write_real("Settings", "Volume", global.volume)
	ini_write_real("Settings", "Fullscreen", global.fullscreen)
	ini_write_real("Settings", "Vsync", global.vscync ? 1 : 0)
	ini_write_real("Settings", "Window_Size", global.window_size)
	ini_write_real("Settings", "Hold_to_float", global.float_hold)
	
	ini_close()
}