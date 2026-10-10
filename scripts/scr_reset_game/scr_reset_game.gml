function game_reset(){
	global.level[0] = true;
	global.level[1] = false;
	global.level[2] = false;
	global.level[3] = false;
	global.level[4] = false;
	global.level[5] = false;
	global.powerup = 0;
	global.lives = 3;
	global.hp = 6;
	global.hub_room = rm_hub_1;
}