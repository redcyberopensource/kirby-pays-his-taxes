// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_game(filename){
	ini_open(filename)
	
	var room_name = ini_read_string("Game", "Current_Hub_Room", "rm_hub_1")
	global.hub_room = asset_get_index(room_name)
	
	for (var i = 0; i < array_length(global.level); i++) {
	    global.level[i] = (ini_read_real("Game", "Level" + string(i), 0) == 1);
	}
	
	global.hp = ini_read_real("Game", "Health", 6)
	
	global.lives = ini_read_real("Game", "Lives", 3)
	
	global.powerup = ini_read_real("Game", "Copy_Ability", 0)
	
	ini_close()
	
	room_set_persistent(global.hub_room, false);
	
	room_goto(global.hub_room)
}