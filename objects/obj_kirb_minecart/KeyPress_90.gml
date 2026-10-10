if (kirb_inside = true)
{
	kirb_inside = false;
	view_set_visible(1, false)
	sprite_index = spr_kirb_minecart_empty
	instance_create_depth(x, y, 0, obj_kirb)
	alarm[0] = 40
}