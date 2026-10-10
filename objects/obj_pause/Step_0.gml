if (room = rm_title) || (room = rm_menu)
{
	instance_destroy()
}

if (global.powerup = 0)
{
		pause_text[0] = "KIRBY"
		pause_text[1] = "eldrich horror being"
		pause_text[2] = "kirby kirby kirby kirby kirby kirby"
		pause_text[3] = ""
		pause_text[4] = ""
		pause_text[5] = ""
		pause_text[6] = ""
		list = spr_list_normal
}
else if (global.powerup = 1)
{
	pause_text[0] = "a r s o n"
	pause_text[1] = "AAAAAAAAAAAAAAAAAAAAA"
	pause_text[2] = "IM ON FIRE"
	pause_text[3] = "H E L P"
	pause_text[4] = ""
	pause_text[5] = ""
	pause_text[6] = ""
	list = spr_list_fire
}
else if (global.powerup = 2)
{
	pause_text[0] = "cut"
	pause_text[1] = "i am tired of this father"
	pause_text[2] = "give me better"
	pause_text[3] = "cut"
	pause_text[4] = ""
	pause_text[5] = ""
	pause_text[6] = ""
	list = spr_list_cutter
}

else if (global.powerup = 3)
{
	pause_text[0] = "BOMB"
	pause_text[1] = "HE"
	pause_text[2] = "HAS"
	pause_text[3] = "A"
	pause_text[4] = "BOMB"
	pause_text[5] = ""
	pause_text[6] = ""
	list = spr_list_bomb
}

else if (global.powerup = 4)
{
	pause_text[0] = "BITCH! YOU STOLE LINK'S HAT!"
	pause_text[1] = "MANY YEARS AGO PRINCE DARKNESS GANNON"
	pause_text[2] = "STOLE ONE OF THE TRIFORCE WITH POWER."
	pause_text[3] = "PRINCESS ZELDA HAD ONE OF THE TRIFORCE"
	pause_text[4] = "WITH WISDOM SHE DIVIDED IT INTO 5 UNITS"
	pause_text[5] = "TO HIDE IT FROM GANNON BEFORE SHE"
	pause_text[6] = "WAS CAPTURED"
	list = spr_list_sword
}
else if (global.powerup = 5)
{
	pause_text[0] = "vroom vroom im a tired"
	pause_text[1] = "ok seriously this is the best ability"
	pause_text[2] = "i made in this entire game"
	pause_text[3] = ""
	pause_text[4] = ""
	pause_text[5] = ""
	pause_text[6] = ""
	list = spr_list_wheel
}

if (keyboard_check_pressed(vk_down) || gamepad_button_check(0, gp_padd)) && (paused)
{
	page = 1
}
if (keyboard_check_pressed(vk_up) || gamepad_button_check(0, gp_padu)) && (paused)
{
	page = 0
}

if (paused) && (room != rm_hub_1)
{
	instance_create_depth(display_get_gui_width()/2,display_get_gui_height()-50,-999, obj_pause_menu)
}
if (paused) && (room = rm_hub_1)
{
	instance_create_depth(display_get_gui_width()/2,display_get_gui_height()-50,-999, obj_pause_menu_hub)
}

if (!paused) && ((instance_exists(obj_pause_menu)) || (instance_exists(obj_pause_menu_hub)))
{
	instance_destroy(obj_pause_menu);
	instance_destroy(obj_pause_menu_hub);
}