vsp += grv

if (place_meeting(x+hsp, y, obj_solid))
{
	while (!place_meeting(x+sign(hsp), y, obj_solid))
	{
		x += sign(hsp)
	}
	hsp = 0;
}
x += hsp

if (place_meeting(x, y+vsp, obj_solid))
{
	while (!place_meeting(x, y+vsp, obj_solid))
	{
		y += sign(vsp)
	}
	vsp = 0;
	hsp = 0;
}
y += vsp
if (hsp != 0) image_xscale = sign(hsp)

switch(state)
{
	case 1:
		sprite_index = spr_moon_guy_attack
		if (instance_exists(obj_sun_guy)) obj_sun_guy.sprite_index = spr_sun_guy_attack
		if (alarm[1] < 0) alarm[1] = 25
	break;
	
	case 2:
		sprite_index = spr_moon_guy_attack
		if (instance_exists(obj_sun_guy)) obj_sun_guy.sprite_index = spr_sun_guy_attack
		if (alarm[2] < 0) alarm[2] = 25
	break;
	
	case 3:
		sprite_index = spr_moon_guy_attack
		if (instance_exists(obj_sun_guy)) obj_sun_guy.sprite_index = spr_sun_guy_attack
		if (alarm[3] < 0) alarm[3] = 25
	break;
}

if (hp <= 0)
{
	hsp = -(hspstart/13) * 7
	instance_create_depth(x, y, 0, obj_camera)
	instance_change(obj_moon_dead, false)
}