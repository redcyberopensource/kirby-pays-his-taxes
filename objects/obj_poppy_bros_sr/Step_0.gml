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
	vsp = -6;
}
y += vsp

if (place_meeting(x, y, obj_pbs_left)) && (!throw_bomb)
{
	hsp = -4.5
}
else if (place_meeting(x, y, obj_pbs_right)) && (!throw_bomb)
{
	hsp = 4.5
}

if (place_meeting(x, y, obj_pbs_left))
{
	image_xscale = -1
}
else if (place_meeting(x, y, obj_pbs_right))
{
	image_xscale = 1
}

if (throw_bomb) && ((place_meeting(x, y ,obj_pbs_left)) || (place_meeting(x, y, obj_pbs_right)))
{
	hsp = 0
	vsp = -10
	alarm[2] = 20
}

if (hp <= 0)
{
	hsp = -hsp/2
	if (global.can_play_music = true) play_music(song_end, true)
	obj_boss_door.image_index = 1
	instance_create_depth(x, y, 0, obj_camera);
	instance_change(obj_poppy_bros_sr_dead, false)
}