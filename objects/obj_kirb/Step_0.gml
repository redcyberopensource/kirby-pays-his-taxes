///@desc Movement, Copy Abilities, Etc.
key_left = keyboard_check(vk_left) || gamepad_button_check(0, gp_padl)
key_right = keyboard_check(vk_right) || gamepad_button_check(0, gp_padr)
key_left_pressed = keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl)
key_right_pressed = keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr)
key_down = keyboard_check(vk_down) || gamepad_button_check(0, gp_padd)
key_up = keyboard_check(vk_up) || gamepad_button_check(0, gp_padu)
key_up_pressed = keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu)
key_jump = keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1)
key_jump_held = keyboard_check(ord("Z")) || gamepad_button_check(0, gp_face1)
key_down_pressed = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd)
key_action_pressed = keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(0, gp_face3)
key_action = keyboard_check(ord("X")) || gamepad_button_check(0, gp_face3)
key_discard_ability = keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(0, gp_select)
key_dodge = keyboard_check_pressed(ord("C")) || gamepad_button_check_pressed(0, gp_paddler) || gamepad_button_check_pressed(0, gp_paddlel)

var move = key_right - key_left;
var hsp_final = hsp + hspeed

if (dodge)
{
	can_move = false;
}

//Moving
if (can_move == true)
{
	//move right
	if (move == 1)
	{
		hsp += acc
		if (hsp >= hsp_max) hsp = hsp_max
	}
	else if (hsp > 0)
	{
		hsp -= acc
	}

	//move left
	if (move == -1)
	{
		hsp -= acc
		if (hsp <= -hsp_max) hsp = -hsp_max
	}
	else if (hsp < 0)
	{
		hsp += acc
	}
}

//Dashing
if (can_dash)
{
	if ((key_left_pressed) || (key_right_pressed)) && hsp != 0 && (dash_counter < 2)
	{
		dash_counter += 1
	}

	if dash_counter >= 2
	{
		hsp_max = 5
	}
	else if dash_counter <= 1
	{
		hsp_max = 3
	}
	if (hsp == 0) dash_counter = 0
}

if ((vsp_fall_max > 0) && (grv > 0 && vsp < vsp_fall_max)) || ((vsp_fall_max < 0) && (grv < 0 && vsp > vsp_fall_max)) {
    vsp += grv;
}


//Stop if cannot move
if (!can_move)
{
	if (hsp > 0)
	{
		hsp -= acc
	}
	if (hsp < 0)
	{
		hsp += acc
	}
	can_dash = false
}

if (!can_dash)
{
	dash_counter = 0
	hsp_max = 3
}

if (vsp_acc) && (vsp > 0)
{
	vsp -= acc
}
else if (vsp_acc) && (vsp < 0)
{
	vsp += acc
}

//Jumping
if (place_meeting(x, y+sign(grv), obj_solid)) && (!key_action)
{
	vsp = key_jump * (vsp_jump * -sign(grv));
	//spr_jump = spr_kirb_jump;
	//spr_fall = spr_kirb_fall;
	vsp_fall_max = 10 * sign(grv)
	
	if (key_jump) audio_play_sound(snd_kirb_jump, 5, false)
}

//Float
if (!place_meeting(x, y+sign(grv), obj_solid)) && (key_jump) && (can_float = true) && (global.powerup != 9)
{
	float = true
	vsp = key_jump * (vsp_float * -sign(grv));
	spr_jump = spr_float_default;
	spr_fall = spr_float_idle_default;
	can_dash = false;
	vsp_fall_max = (2.5 * sign(grv));

	audio_play_sound(snd_kirb_float, 5, false);
}
//Float hold
if (global.float_hold)
{
	if (!place_meeting(x, y+sign(grv), obj_solid)) && (key_jump_held) && (float) && (global.powerup != 9)
	{
		vsp = (vsp_float_held * -sign(grv));
	}
}
else if (key_jump) && (!place_meeting(x, y+sign(grv), obj_solid)) && (global.powerup = 9)
{
	vsp = key_jump * (vsp_jump * -sign(grv));
	//spr_jump = spr_kirb_jump;
	//spr_fall = spr_kirb_fall;
	vsp_fall_max = 10 * sign(grv)
	
	if (key_jump) audio_play_sound(snd_kirb_jump, 5, false)
}

//Float haltmann
if ((key_action_pressed) && (!place_meeting(x, y+sign(grv), obj_solid)) && (float))
{
	spr_jump = spr_float_halt_default
	spr_fall = spr_float_halt_default
	spr_idle = spr_float_halt_default
	var ID = instance_create_depth(x, y, 0, obj_air_spit)
	with ID
	{
		hspeed = 10*obj_kirb.image_xscale
		image_xscale = obj_kirb.image_xscale
	}
	alarm[0] = 6
	vsp_fall_max = 10 * sign(grv);
	can_dash = true
	
	audio_play_sound(snd_kirb_float_halt, 5, false)
}

if ((place_meeting(x, y+sign(grv), obj_solid)) && (float))
{
	float = false
	spr_jump = spr_float_halt_default
	spr_fall = spr_float_halt_default
	spr_idle = spr_float_halt_default
	spr_walk = spr_float_halt_default
	var ID = instance_create_depth(x, y, 0, obj_air_spit)
	with ID
	{
		hspeed = 10*obj_kirb.image_xscale
		image_xscale = obj_kirb.image_xscale
	}
	alarm[0] = 6
	vsp_fall_max = 10 * sign(grv);
	
	audio_play_sound(snd_kirb_float_halt, 5, false)
}


//Horizontal movement
if (place_meeting(x+hsp, y, obj_solid))
{
	yplus = 0;
	while (place_meeting(x+hsp, y-yplus, obj_solid) && yplus <= abs(1*hsp))
	{
		yplus += 1
	}
	
	if (place_meeting(x+hsp, y-yplus, obj_solid))
	{
		while (!place_meeting(x+sign(hsp), y, obj_solid))
		{
			x += sign(hsp)
			//hsp_final -= sign(hsp_final)
		}
		hsp = 0
		hspeed = 0;
		//x = x - (1 * -sign(hspeed))
	}
	else
	{
		y -= yplus
	}
	
}
x += hsp

if (instance_exists(obj_wind))
{
    // only apply forced movement if not immediately blocked
    if (!place_meeting(x + sign(hsp_forced) * max(1, 5), y, obj_solid))
    {
        hspeed = hsp_forced;
    }
    else
    {
        hspeed = 0;
    }
}

//g o  d o w n  s l o p e s
while (place_meeting(x, y+hsp_max+1, obj_slope) && (!place_meeting(x, y+sign(grv), obj_slope)) && vspeed >=0)
{
	y += 1
}

//Vertical movement
if (place_meeting(x, y+vsp, obj_solid))
{
	while (!place_meeting(x, y+sign(vsp), obj_solid))
	{
		y += sign(vsp)
	}
	vsp = 0;
}

y += vsp

if place_meeting(x, y, obj_kibble_suck) || place_meeting(x, y, obj_star_cutter_suck)
{
	global.powerup = 2
}

if place_meeting(x, y, obj_flamer_suck) || place_meeting(x, y, obj_star_fire_suck)
{
	global.powerup = 1
}

//Air doge
if (key_dodge) && (can_move) && (can_float) && (!float) && (!dodge) && (can_dodge) && (!place_meeting(x, y+sign(grv), obj_solid))
{
	can_move = false;
	can_float = false;
	can_turn = false;
	can_use_ability = false;
	
	dodge = true;
	can_dodge = false;
	
	image_alpha = 0.5;
	image_speed = 0;
	can_hurt = false;
	vsp = 0;
	hsp = 0
	grv = 0;
	
	if (key_left) hsp = -5
	if (key_right) hsp = 5
	if (key_down) vsp = 5
	if (key_up) vsp = -5
	vsp_acc = true
	
	alarm[4] = 30
}

//Stop airdoge if touching floor
if (place_meeting(x, y+sign(current_grv), obj_solid)) && (dodge)
{
	dodge = false;
	can_dodge = true
	can_float = true;
	can_move = true;

	can_hurt = true;
	grv = current_grv;
	image_speed = 1;
	image_alpha = 1
	vsp_acc = false
	
	spr_walk = spr_idle_default
	alarm[0] = 13
	
	can_dash = true;
	
	hspeed = 0
}

if (mouth_full)
{
	spr_idle_default = spr_kirb_inhaled_idle;
	spr_walk_default = spr_kirb_inhaled_walk;
	spr_run_default = spr_kirb_inhaled_walk;
	spr_jump_default = spr_kirb_inhaled_jump;
	spr_fall_default = spr_kirb_inhaled_fall;
}

//Change image_yscale
if (grv > 0)
{
	image_yscale = 1;
}
else if (grv < 0)
{
	image_yscale = -1;
}

//Gravity portals
if (place_meeting(x, y, obj_anti_gravity_portal))
{
	current_grv = -0.25
	grv = -0.25
	vsp = -3
	with obj_anti_gravity_portal
	{
		mask_index = spr_absolutely_nothing;
		alarm[0] = 30
	}
}
else if (place_meeting(x, y, obj_gravity_portal))
{
	current_grv = 0.25
	grv = 0.25
	vsp = 3
	with obj_gravity_portal
	{
		mask_index = spr_absolutely_nothing;
		alarm[0] = 30
	}
}


if place_meeting(x, y, par_enemy_suck)
{
	can_hurt = false;
	alarm[3] = 10;
	mouth_full = true;
	can_play_inhale = false;
	instance_destroy(obj_particle_suck)
	audio_stop_sound(snd_kirb_inhale)
	audio_stop_sound(snd_kirb_inhale_1)
	can_float = false;
	can_move = true;
	can_dash = false;
	can_turn = true;
	spr_idle_default = spr_kirb_inhaled_idle;
	spr_walk_default = spr_kirb_inhaled_walk;
	spr_run_default = spr_kirb_inhaled_walk;
	spr_jump_default = spr_kirb_inhaled_jump;
	spr_fall_default = spr_kirb_inhaled_fall;
	spr_idle = spr_kirb_inhaled_idle;
	spr_walk = spr_kirb_inhaled_walk;
	spr_run = spr_kirb_inhaled_walk;
	spr_jump = spr_kirb_inhaled_jump;
	spr_fall = spr_kirb_inhaled_fall;
	with par_enemy_suck
	{
		instance_destroy()
	}
}

if (mouth_full) && (key_down_pressed)
{
	can_use_ability = true;
	spr_idle = spr_kirb_swallow;
	spr_fall = spr_kirb_swallow;
	spr_jump = spr_kirb_swallow;
	spr_walk = spr_kirb_swallow;
	spr_run = spr_run_default;
	can_move = true
	can_float = true;
	can_dash = true;
	mouth_full = false
	audio_play_sound(snd_kirb_swallow, 5, false)
	alarm[0] = 6
}

if (mouth_full) && (key_action_pressed)
{
	global.powerup = 0;
	ID = instance_create_depth(x, y, -2, obj_star_spit)
	with ID
	{
		hspeed = obj_kirb.image_xscale*15
	}
	
	spr_idle = spr_kirb_float_halt;
	spr_fall = spr_kirb_float_halt;
	spr_jump = spr_kirb_float_halt;
	spr_walk = spr_kirb_float_halt;
	spr_run = spr_run_default;
	can_move = true
	can_float = true;
	can_dash = true;
	alarm[0] = 6
	
	audio_play_sound(snd_kirb_spit, 5, false)
}
get_abilities()
copy_animations()

//Discard ability
if (key_discard_ability) && (!mouth_full) && (!float)
{
	switch (global.powerup)
	{
		case 1:
			instance_create_depth(x, y, 0, obj_star_fire)
		break;
		
		case 2:
			instance_create_depth(x, y, 0, obj_star_cutter)
		break;
		
		case 3:
			instance_create_depth(x, y, 0, obj_star_bomb)
		break;
		
		case 4:
			instance_create_depth(x, y, 0, obj_star_sword)
		break;
		
		case 5:
			instance_create_depth(x, y, 0, obj_star_wheel)
		break;
		
		case 6:
			instance_create_depth(x, y, 0, obj_star_ninja)
		break;
		
		case 7:
			instance_create_depth(x, y, 0, obj_star_v)
		break;
		
		case 8:
			instance_create_depth(x, y, 0, obj_star_smash)
		break;
		
		case 9:
			instance_create_depth(x, y, 0, obj_kirb_ufo_empty)
		break;
	}
	
	global.powerup = 0;
	spr_fall = spr_kirb_fall;
	spr_jump = spr_kirb_jump;
	spr_idle = spr_kirb_idle;
	spr_walk = spr_kirb_walk;
	spr_run = spr_kirb_run;
	vsp_fall_max = 10 * sign(grv)
	spr_float_default = spr_kirby_float;
	spr_float_idle_default = spr_kirby_float_idle;
	spr_float_halt_default = spr_kirb_float_halt;
	alarm[0] = 2
}

//Hurt
if ((place_meeting(x, y, par_enemy)) || (place_meeting(x, y, par_hazard))) && (can_hurt) && (global.hp > 0)
{
	switch (global.powerup)
	{
		case 1:
			instance_create_depth(x, y, 0, obj_star_fire)
			with obj_flamethrower instance_destroy()
		break;
		
		case 2:
			instance_create_depth(x, y, 0, obj_star_cutter)
		break;
		
		case 3:
			instance_create_depth(x, y, 0, obj_star_bomb)
		break;
		
		case 4:
			instance_create_depth(x, y, 0, obj_star_sword)
		break;
		
		case 5:
			instance_create_depth(x, y, 0, obj_star_wheel)
		break;
		
		case 6:
			instance_create_depth(x, y, 0, obj_star_ninja)
		break;
		
		case 7:
			instance_create_depth(x, y, 0, obj_star_v)
		break;
		
		case 8:
			instance_create_depth(x, y, 0, obj_star_smash)
		break;
		
		case 9:
			instance_create_depth(x, y, 0, obj_kirb_ufo_empty)
		break;
	}
	
	mouth_full = false;
	float = false;
	global.powerup = 0;
	spr_fall = spr_kirb_hurt;
	spr_jump = spr_kirb_hurt;
	spr_idle = spr_kirb_hurt;
	spr_walk = spr_kirb_hurt;
	can_move = false;
	vsp = -3;
	hsp = -3*image_xscale;
	global.hp--
	can_hurt = false;
	image_alpha = 0.5;
	alarm[0] = 20
	alarm[3] = 90
	
	if (!audio_is_playing(snd_kirb_hurt))
	{
		audio_play_sound(snd_kirb_hurt, 5, false)
	}
}
else if (place_meeting(x, y, par_enemy)) && (global.hp < 1) && (can_hurt)
{
	mouth_full = false;
	instance_create_depth(x, y, -3, obj_kirb_die)
	global.hp = 0
	instance_destroy()
}
if (global.hp < 1) //&& (can_hurt)
{
	mouth_full = false;
	instance_create_depth(x, y, -3, obj_kirb_die)
	//global.hp = 0
	instance_destroy()
}

//Instakill
if (place_meeting(x, y, par_instakill)) && (can_hurt)
{
	mouth_full = false;
	global.powerup = 0;
	//instance_create_depth(x, y, -3, obj_kirby_die)
	global.hp = 0
	//instance_destroy()
}

//G A M E     O V E R
if (global.lives < 0)
{
	with obj_game_hud instance_destroy()
	room_goto(rm_game_over)
}

//Animation
if ((move != 0) && (can_turn)) image_xscale = move
if place_meeting(x, y+sign(grv), obj_solid)
{
	if (hsp = 0) sprite_index = spr_idle;
	else if (hsp != 0)
	{
		if (dash_counter < 2) sprite_index = spr_walk
		else if (dash_counter >= 2) sprite_index = spr_run
	}
}
else if (!place_meeting(x, y+sign(grv), obj_solid))
{
	if ((vsp < 0) && (grv > 0)) || ((vsp > 0) && (grv < 0))
	{
		sprite_index = spr_jump
	}
	else if ((vsp > 0) && (grv > 0)) || ((vsp < 0) && (grv < 0))
	{
		sprite_index = spr_fall
	}
}

image_angle += rot;