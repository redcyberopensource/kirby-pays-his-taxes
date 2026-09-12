if (!instance_exists(obj_moon_guy)) camera_set_view_target(view_camera[0], obj_kirb);
instance_destroy(obj_solid_2)
vsp += grv

if (place_meeting(x+hsp, y, obj_solid))
{
	while (!place_meeting(x+sign(hsp), y, obj_solid))
	{
		x += sign(hsp)
	}
	hsp = 0
}

x += hsp

if (place_meeting(x, y+vsp, obj_solid))
{
	while (!place_meeting(x, y+sign(vsp), obj_solid))
	{
		y += sign(vsp)
	}
	vsp = 0
	hsp = 0
}

y += vsp