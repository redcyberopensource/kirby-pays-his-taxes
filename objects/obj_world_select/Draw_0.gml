draw_sprite(spr_banners_main, current_number, 0, 89)

for (var i = 0; i < max_numbers+1; i++)
{
	draw_sprite(number_sprite, i, 72+(i*52), 384)
}

draw_sprite(spr_kirby_warp, 0, kirb_x, kirb_y);
draw_sprite(spr_ws_arrows, section, 32, 368)

draw_set_font(kirbfont)
draw_set_color(c_blue)
draw_text(30, 50, "WORLD SELECT")
draw_set_color(c_white)
draw_text(28, 48, "WORLD SELECT")