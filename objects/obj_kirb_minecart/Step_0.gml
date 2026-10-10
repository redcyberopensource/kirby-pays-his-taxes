vsp += grv

hsp = spd

var yplus = 0
angle = yplus

//Horizontal collision
if (place_meeting(x+hsp, y, obj_solid))
{
	angle = 0
	
	while (place_meeting(x+hsp, y-yplus, obj_solid) && yplus <= abs(1*hsp))
	{
		yplus += 1
	}
	
	if (place_meeting(x+hsp, y-yplus, obj_solid))
	{
		while (!place_meeting(x+sign(hsp), y, obj_solid))
		{
			x += sign(hsp)
		}
		hsp = 0
	}
	else
	{
		y -= yplus
	}
	
}
x += hsp

//Vertical collision
if (place_meeting(x, y+vsp, obj_solid))
{
	while (!place_meeting(x, y+sign(vsp), obj_solid))
	{
		y += sign(vsp)
	}
	vsp = 0
}

y += vsp

if (hsp != 0) image_xscale = sign(hsp)

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
	}
	
	global.powerup = 0;
	vsp = -3;
	hsp = -3*image_xscale;
	global.hp--
	can_hurt = false;
	image_alpha = 0.5;
	alarm[1] = 90
	
	if (!audio_is_playing(snd_kirb_hurt))
	{
		audio_play_sound(snd_kirb_hurt, 5, false)
	}
}

if (spd != 0) && (hsp = 0) && (kirb_inside = false)
{
	instance_destroy()
}

else if (place_meeting(x, y, par_enemy)) && (global.hp < 1) && (can_hurt)
{
	instance_create_depth(x, y, -3, obj_kirb_die)
	global.hp = 0
	instance_destroy()
}

//Instakill
if (place_meeting(x, y, par_instakill)) && (kirb_inside)
{
	global.powerup = 0;
	instance_create_depth(x, y, -3, obj_kirb_die)
	global.hp = 0
	instance_destroy()
}

//G A M E     O V E R
if (global.lives < 0)
{
	room_goto(rm_game_over)
}