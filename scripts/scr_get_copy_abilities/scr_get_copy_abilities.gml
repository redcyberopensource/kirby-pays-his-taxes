function get_abilities(){

var move = key_right - key_left;

if (mouth_full = false) && (!float)
{
	switch (global.powerup)
	{
		case 0: //No ability
			if (key_action_pressed) && (!mouth_full)
			{
				ID = instance_create_depth(x, y, 1, obj_particle_suck)
				with ID
				{
					image_xscale = obj_kirb.image_xscale
				}
	
				can_turn = false;
				can_move = false;
				can_float = false;
				spr_idle = spr_kirb_suck;
				spr_fall = spr_kirb_suck;
				spr_jump = spr_kirb_suck;
				spr_run = spr_kirb_suck;
				spr_walk = spr_kirb_suck
				
				can_play_inhale = true
				audio_play_sound(snd_kirb_inhale, 5, false)
				alarm[6] = 50
			}
			else if (!key_action)
			{
				if (!instance_exists(par_enemy_suck))
				{
					if instance_exists(obj_particle_suck)
					{
						with obj_particle_suck instance_destroy()
						can_turn = true;
						can_move = true;
						can_dash = true;
						can_float = true;
						spr_idle = spr_idle_default;
						spr_fall = spr_fall_default;
						spr_jump = spr_jump_default;
						spr_walk = spr_walk_default;
						spr_run = spr_run_default;
						audio_stop_sound(snd_kirb_inhale)
						audio_stop_sound(snd_kirb_inhale_1)
						can_play_inhale = false;
					}
				}
			}
		break;
		
		case 1: //Fire ability
			if (key_action_pressed) && (can_use_ability) && !((dash_counter >= 2) && (can_use_ability) && (!burning) && (!place_meeting(x, y+1, obj_solid)))
			{
				ID = instance_create_depth(x, y+irandom_range(-12, 12), 1, obj_flamethrower)
				with ID
				{
					image_xscale = obj_kirb.image_xscale
					hspeed = obj_kirb.image_xscale * 10
				}
	
				//can_turn = false;
				can_move = false;
				can_float = false;
				spr_idle = spr_kirb_fire_flamethrower;
				spr_fall = spr_kirb_fire_flamethrower;
				spr_jump = spr_kirb_fire_flamethrower;
				spr_run = spr_kirb_fire_flamethrower;
				spr_walk = spr_kirb_fire_flamethrower;
			}
			else if (!key_action) && !((dash_counter >= 2) && (can_use_ability) && (!burning) && (!place_meeting(x, y+1, obj_solid)))
			{
				//with obj_particle_suck instance_destroy()
				with obj_flamethrower instance_destroy()
				can_turn = true;
				can_move = true;
				can_float = true;
				can_dash = true
				spr_idle = spr_idle_default;
				spr_fall = spr_fall_default;
				spr_jump = spr_jump_default;
				spr_walk = spr_walk_default;
				spr_run = spr_run_default;
			}
			
			if (key_action_pressed) && (dash_counter >= 2) && (can_use_ability) && (!burning) && (!place_meeting(x, y+1, obj_solid))
			{
				burning_start = true
				hsp = -2*image_xscale
				if (alarm[7] < 0) alarm[7] = 8
			}
			if (burning_start)
			{
				acc = 0;
				sprite_index = spr_kirb_fire_burning_start;
				spr_idle = spr_kirb_fire_burning_start;
				spr_fall = spr_kirb_fire_burning_start;
				spr_jump = spr_kirb_fire_burning_start;
				spr_run = spr_kirb_fire_burning_start;
				spr_walk = spr_kirb_fire_burning_start;
				can_move = false;
				can_turn = false;
				can_float = false;
				vsp = 0;
				grv = 0;
				
			}
			
			if (burning)
			{
				burning_start = false
				can_move = false
				can_turn = false
				sprite_index = spr_kirb_fire_burning;
				spr_idle = spr_kirb_fire_burning;
				spr_fall = spr_kirb_fire_burning;
				spr_jump = spr_kirb_fire_burning;
				spr_run = spr_kirb_fire_burning;
				spr_walk = spr_kirb_fire_burning;
				hsp_max = 8
				hsp = 8*image_xscale
			}
			
			if (burning) && (place_meeting(x+hsp, y, obj_solid))
			{
				burning = false
				hsp = -1*image_xscale
				vsp = (-4 * (sign(grv)))
				spr_jump = spr_fall_default;
				spr_fall = spr_fall_default;
				spr_idle = spr_idle_default;
				spr_walk = spr_walk_default;
				spr_run = spr_run_default;
				
				alarm[0] = 5
			}
 		break;
		
		case 2: //Cutter ability
			if (key_action_pressed) && (can_use_ability) && (!(cutter_dash || cutter_drop))
			{
				can_turn = false;
				can_move = false;
				can_float = false;
				spr_idle = spr_kirb_cutter_boomerang;
				spr_fall = spr_kirb_cutter_boomerang;
				spr_jump = spr_kirb_cutter_boomerang;
				spr_run = spr_kirb_cutter_boomerang;
				spr_walk = spr_kirb_cutter_boomerang;
				alarm[1] = 4
				alarm[0] = 12
			}
			else if (!key_action)
			{
				//with obj_particle_suck instance_destroy()
				can_turn = true;
				can_move = true;
				can_float = true;
				can_dash = true
			}
			if (dash_counter >= 2) && (key_action) && (can_use_ability) && (move != 0) && (!cutter_dash)
			{
				cutter_dash = true
				alarm[0] = 60
				if (key_left) hsp = -7
				if (key_right) hsp = 7
			}
			
			if (cutter_dash)
			{
				instance_create_depth(x, y, 0, obj_cutter_dash_hitbox)
				can_use_ability = false
				can_move = false;
				can_turn = false;
				hsp_max = 7
				acc = 0
				//hsp = 0;
				spr_idle = spr_kirb_cutter_dash;
				spr_fall = spr_kirb_cutter_dash;
				spr_jump = spr_kirb_cutter_dash;
				spr_run = spr_kirb_cutter_dash;
				spr_walk = spr_kirb_cutter_dash;
				if (key_left_pressed) hsp = -7
				if (key_right_pressed) hsp = 7
			}
			if (key_down) && (key_action_pressed) && (can_use_ability) && (!place_meeting(x, y+1, obj_solid))
			{
				cutter_drop = true
			}
			
			if (cutter_drop)
			{
				instance_create_depth(x, y, 0, obj_cutter_drop_hitbox)
				if (instance_exists(obj_boomerang)) with obj_boomerang instance_destroy()
				can_turn = false;
				can_move = false;
				can_float = false;
				vsp = (8 * (sign(grv)))
				if (image_xscale = -1) hsp = -7
				if (image_xscale = 1) hsp = 7
				spr_idle = spr_kirb_cutter_drop;
				spr_fall = spr_kirb_cutter_drop;
				spr_jump = spr_kirb_cutter_drop;
				spr_run = spr_kirb_cutter_drop;
				spr_walk = spr_kirb_cutter_drop;
			}
			
			if (cutter_drop) && (place_meeting(x, y+1, obj_solid))
			{
				cutter_drop = false
				instance_destroy(obj_cutter_drop_hitbox)
				alarm[0] = 2
			}
		break;
		
		case 3: //Bomb ability
			if (key_action_pressed) && (!key_down) && (can_use_ability)
			{
				can_turn = false;
				can_move = false;
				can_float = false;
				spr_idle = spr_kirb_bomb_throw;
				spr_fall = spr_kirb_bomb_throw;
				spr_jump = spr_kirb_bomb_throw;
				spr_run = spr_kirb_bomb_throw;
				spr_walk = spr_kirb_bomb_throw;
				alarm[2] = 10
				alarm[0] = 17
			}
			if (key_action_pressed) && (key_down) && (can_use_ability)
			{
				instance_create_depth(x, y, -1, obj_bomb_dropped)
			}
			else if (!key_action)
			{
				//with obj_particle_suck instance_destroy()
				can_turn = true;
				can_move = true;
				can_float = true;
				can_dash = true
			}
		break;
		
		case 4: //Sword ability
			if (key_action_pressed) && (!float) && (can_use_ability) && (sword_dash = false)
			{
				can_turn = false;
				can_move = false;
				can_float = false;
				image_index = 0;
				instance_create_depth(x, y, 0, obj_sword_slash_hit)
				spr_idle = spr_kirb_sword_slash;
				spr_fall = spr_kirb_sword_slash;
				spr_jump = spr_kirb_sword_slash;
				spr_run = spr_kirb_sword_slash;
				spr_walk = spr_kirb_sword_slash;
				alarm[0] = 16
			}
			
			if (key_action_pressed) && (!float) && (key_up) && (can_use_ability)
			{
				can_turn = false;
				can_move = false;
				can_float = false;
				can_use_ability = false
				image_index = 0;
				//grv = 0.1;
				vsp = (-10 * (sign(grv)));
				instance_create_depth(x, y, 0, obj_sword_upwards_hit)
				spr_idle = spr_kirb_sword_upward_slash;
				spr_fall = spr_kirb_sword_upward_slash;
				spr_jump = spr_kirb_sword_upward_slash;
				spr_run = spr_kirb_sword_upward_slash;
				spr_walk = spr_kirb_sword_upward_slash;
				alarm[0] = 44;
			}
			if (key_action_pressed) && (!float) && (key_down) && (can_use_ability) && (!sword_drop)
			{
				sword_drop = true
			}
			if (sword_drop)
			{
				sword_drop = true
				can_turn = false;
				can_move = false;
				can_float = false;
				can_use_ability = false
				image_index = 0;
				grv = 0;
				vsp_fall_max = 15
				vsp = (15 * (sign(current_grv)));
				instance_create_depth(x, y, 0, obj_sword_drop_hit)
				sprite_index = spr_kirb_sword_drop
				spr_idle = spr_kirb_sword_drop;
				spr_fall = spr_kirb_sword_drop;
				spr_jump = spr_kirb_sword_drop;
				spr_run = spr_kirb_sword_drop;
				spr_walk = spr_kirb_sword_drop;
			}
			
			if (sword_drop) && (place_meeting(x, y+1, obj_solid))
			{
				sword_drop = false
				instance_destroy(obj_sword_drop_hit)
				alarm[0] = 2
			}
			
			if (dash_counter >= 2) && (key_action_pressed) && (!float) && (can_use_ability)
			{
				sword_dash = true
				alarm[0] = 24;
			}
			
			if (sword_dash)
			{
				spr_idle = spr_kirb_sword_dash;
				spr_fall = spr_kirb_sword_dash;
				spr_jump = spr_kirb_sword_dash;
				spr_run = spr_kirb_sword_dash;
				spr_walk = spr_kirb_sword_dash;
				acc = 0.2
				hsp = 10*image_xscale
				can_move = false;
				can_jump = false;
				can_turn = false;
				can_float = false
			}
		break;
		
		case 5: //Wheel ability
			if (key_action_pressed) && (can_use_ability) && (!float)
			{
				wheel_roll = true;
			}
			
			if (wheel_roll)
			{
				spr_idle = spr_kirb_wheel_roll;
				spr_fall = spr_kirb_wheel_roll;
				spr_jump = spr_kirb_wheel_roll;
				spr_run = spr_kirb_wheel_roll;
				spr_walk = spr_kirb_wheel_roll;
				hsp = 10* image_xscale;
				can_move = false;
				can_turn = false;
				can_float = false;
			}
			
			if (wheel_roll) && ((place_meeting(x+sign(hsp), y, obj_solid)) || (!key_action))
			{
				wheel_roll = false;
				spr_idle = spr_kirb_wheel_roll_cancel;
				spr_fall = spr_kirb_wheel_roll_cancel;
				spr_jump = spr_kirb_wheel_roll_cancel;
				spr_run = spr_kirb_wheel_roll_cancel;
				spr_walk = spr_kirb_wheel_roll_cancel;
				alarm[0] = 8
			}
		break;
		
		case 6: //Ninja ability
			if (key_action_pressed) && (!float) && (can_use_ability) && (!key_down) && (!key_up) && (dash_counter < 2)
			{
				can_turn = false;
				can_move = false;
				can_float = false;
				image_index = 0;
				spr_idle = spr_kirb_ninja_throw;
				spr_fall = spr_kirb_ninja_throw;
				spr_jump = spr_kirb_ninja_throw;
				spr_run = spr_kirb_ninja_throw;
				spr_walk = spr_kirb_ninja_throw;
				alarm[2] = 9.6
				alarm[0] = 16;
			}
			
			if (key_action_pressed) && (!float) && (key_down) && (can_use_ability) && (!ninja_dive)
			{
				ninja_dive = true
			}
			
			if (ninja_dive)
			{
				//sword_drop = true
				can_turn = false;
				can_move = false;
				//can_float = false;
				can_use_ability = false
				image_index = 0;
				//grv = 0;
				vsp_fall_max = 15
				vsp = (10 * (sign(current_grv)));
				hsp_max = 13
				hsp = 13 * image_xscale
				//instance_create_depth(x, y, 0, obj_sword_drop_hit)
				sprite_index = spr_kirb_ninja_dive
				spr_idle = spr_kirb_ninja_dive;
				spr_fall = spr_kirb_ninja_dive;
				spr_jump = spr_kirb_ninja_dive;
				spr_run = spr_kirb_ninja_dive;
				spr_walk = spr_kirb_ninja_dive;
			}
			if (ninja_dive) && (key_jump)
			{
				ninja_dive = false
				sprite_index = spr_float_idle_default
				vsp = key_jump * (vsp_float * -sign(grv));
				spr_jump = spr_float_default;
				spr_fall = spr_float_idle_default;
				can_dash = false;
				vsp_fall_max = (2.5 * sign(grv));
				grv = current_grv
				float = true;
			}
			
			if (ninja_dive) && (place_meeting(x, y+1, obj_solid))
			{
				ninja_dive = false
				//instance_destroy(obj_sword_drop_hit)
				alarm[0] = 1
			}
			
			if (key_action_pressed) && (!float) && (key_up) && (can_use_ability) && (!ninja_dive) && (!ninja_teleport)
			{
				ninja_teleport = true
				grv = 0;
				vsp = 0;
				hsp = 0;
				sprite_index = spr_kirb_ninja_teleoprt
				spr_idle = spr_kirb_ninja_teleoprt;
				spr_fall = spr_kirb_ninja_teleoprt;
				spr_jump = spr_kirb_ninja_teleoprt;
				spr_run = spr_kirb_ninja_teleoprt;
				spr_walk = spr_kirb_ninja_teleoprt;
				image_alpha = 0.5;
			}
			
			if (ninja_teleport)
			{
				if (ninja_teleport) && (image_index > 2)
				{
					image_index = 2
				}
			
				if (ninja_teleport) && (key_left_pressed) 
					{
						//x = x - 140
						x = x - 140
						image_alpha = 1;
						ninja_teleport = false;
						alarm[0] = 10
					}
				else if (ninja_teleport) && (key_right_pressed) 
					{
						x = x + 140
						image_alpha = 1;
						ninja_teleport = false;
						alarm[0] = 10
					}
				else if (ninja_teleport) && (key_down_pressed) 
					{
						y = y + 140
						image_alpha = 1;
						ninja_teleport = false;
						alarm[0] = 10
					}
				else if (ninja_teleport) && (key_up_pressed) 
					{
						y = y - 140
						image_alpha = 1;
						ninja_teleport = false;
						alarm[0] = 10
					}
			
			}
			
			if (dash_counter >= 2) && (key_action_pressed) && (!float) && (can_use_ability)
			{
				ninja_dash = true;
				alarm[0] = 30
			}
			
			if (ninja_dash)
			{
				sprite_index = spr_kirb_ninja_dash;
				spr_idle = spr_kirb_ninja_dash;
				spr_fall = spr_kirb_ninja_dash;
				spr_jump = spr_kirb_ninja_dash;
				spr_run = spr_kirb_ninja_dash;
				spr_walk = spr_kirb_ninja_dash;
				vsp = 0;
				grv = 0;
				acc = 0.2
				hsp = 10*image_xscale
				can_move = false;
				can_jump = false;
				can_turn = false;
				can_float = false
			}
		break;
		
		case 7: //VVVVVVVVVV Ability
			if (key_action_pressed) && (!float) && (can_use_ability)
			{
				if (current_grv = 0.25)
				{
					current_grv = -0.25;
					grv = -0.25;
					vsp = -3;
				}
				else if (current_grv = -0.25)
				{
					current_grv = 0.25;
					grv = 0.25;
					vsp = 3;
				}
			}
		break;
		
		case 8: //Smash Ability
			if (key_action) && (!float) && (can_use_ability) && (place_meeting(x, y+1, obj_solid)) && (!smash_jab) && !(key_left || key_right)
			{
				smash_jab = true;
			}
			if (key_action_pressed) && (smash_jab)
			{
				instance_create_depth(x, y, 0, obj_jab_part)
			}
			if (smash_jab)
			{
				can_use_ability = false;
				can_move = false
				sprite_index = spr_kirb_smash_jab
				spr_idle = spr_kirb_smash_jab;
				spr_fall = spr_kirb_smash_jab;
				spr_jump = spr_kirb_smash_jab;
				spr_run = spr_kirb_smash_jab;
				spr_walk = spr_kirb_smash_jab;
			}
			if (!key_action) && (smash_jab)
			{
				smash_jab = false;
				instance_destroy(obj_jab_part)
				alarm[0] = 2
			}
			
			if (key_action) && (!float) && (can_use_ability) && (key_left || key_right) && (place_meeting(x, y+1, obj_solid)) && (!smash_hammer)
			{
				smash_hammer = true;
			}
			if (smash_hammer) && (key_action)
			{
				image_index = 0;
				image_speed = 0;
				can_move = false;
				can_jump = false;
				spr_idle = spr_kirb_smash_hammer;
				spr_fall = spr_kirb_smash_hammer;
				spr_jump = spr_kirb_smash_hammer;
				spr_run = spr_kirb_smash_hammer;
				spr_walk = spr_kirb_smash_hammer;
			}
			else if (smash_hammer) && (!key_action)
			{
				smash_hammer = false;
				image_speed = 1;
				spr_idle = spr_kirb_smash_hammer;
				spr_fall = spr_kirb_smash_hammer;
				spr_jump = spr_kirb_smash_hammer;
				spr_run = spr_kirb_smash_hammer;
				spr_walk = spr_kirb_smash_hammer;
				alarm[0] = 24
			}
			
			if (key_action_pressed) && (!float) && (can_use_ability) && (!place_meeting(x, y+1, obj_solid))
			{
				smash_spin = true;
				instance_create_depth(x, y, 0, obj_smash_spin_hitbox);
				alarm[0] = 20
			}
			if (smash_spin)
			{
				spr_idle = spr_kirb_smash_spin;
				spr_fall = spr_kirb_smash_spin;
				spr_jump = spr_kirb_smash_spin;
				spr_run = spr_kirb_smash_spin;
				spr_walk = spr_kirb_smash_spin;
				rot = 20;
			}
			if (smash_spin) && (place_meeting(x, y+1, obj_solid))
			{
				alarm[0] = 1
			}
		break;
		
		case 9://UFO
		
			//ts was so easy to code
		
		break;
	}
}
}