/// @description Draw Menu

//draw the background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1)

//draw options
draw_set_font(fnt_text_1);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var i = 0; i < op_length; i++)
{
	var c = c_white;
	if pos = i
	{
		c = c_yellow
	}
	draw_text_color(x+op_border, y + op_border + op_space * i, option[i], c, c, c, c, 1);
}

draw_set_halign(fa_right);
draw_set_color(c_white)

if (global.can_play_music = true)
{
	draw_text(x+op_border+450, y+op_border, "On")
}
else if (global.can_play_music = 0)
{
	draw_text(x+op_border+450, y+op_border, "Off")
}
draw_text(x+op_border+450, y+op_border+op_space, global.volume)
if (global.fullscreen = true)
{
	draw_text(x+op_border+450, y+op_border+op_space*2, "Fullscreen")
}
else
{
	draw_text(x+op_border+450, y+op_border+op_space*2, "Windowed")
}
if (global.vscync = true)
{
	draw_text(x+op_border+450, y+op_border+op_space*3, "On")
}
else
{
	draw_text(x+op_border+450, y+op_border+op_space*3, "Off")
}

if (global.window_size = 1)
{
	draw_text(x+op_border+450, y+op_border+op_space*4, "640x480")
}
else if (global.window_size = 2)
{
	draw_text(x+op_border+450, y+op_border+op_space*4, "920x720")
}
else if (global.window_size = 3)
{
	draw_text(x+op_border+450, y+op_border+op_space*4, "1440x1080")
}

if (global.float_hold = true)
{
	draw_text(x+op_border+450, y+op_border+op_space*5, "Hold")
}
else if (global.float_hold = false)
{
	draw_text(x+op_border+450, y+op_border+op_space*5, "Press")
}