var tex = cloud_get_tex();   // first, it may switch the draw target

var old_repeat = gpu_get_texrepeat();
var old_filter = gpu_get_tex_filter();
gpu_set_texrepeat(true);
gpu_set_tex_filter(true);    // delete this line for crisp pixel-art clouds

var tiles_across = area_w / tile_px;   // how many tiles fit the room width at the near edge
var cx = area_x + area_w * 0.5;

draw_primitive_begin_texture(pr_trianglestrip, tex);
for (var i = 0; i <= strips; i++) {
    var t  = i / strips;                 // 0 = far edge, 1 = near edge
    var yy = area_y + area_h * (1 - t);

    var s     = lerp(horizon, 1, t);     // perspective scale
    var _depth = 1 / s;                   // larger = farther away

    // Wider U range when far away = more, smaller tiles = perspective
    var half_u = tiles_across * 0.5 * _depth;
    var v = _depth * depth_tiles + scroll_v;
    var a = power(t, fade_power);

    draw_vertex_texture_colour(area_x,          yy, scroll_u + 0.5 - half_u, v, c_white, a);
    draw_vertex_texture_colour(area_x + area_w, yy, scroll_u + 0.5 + half_u, v, c_white, a);
}
draw_primitive_end();

gpu_set_texrepeat(old_repeat);
gpu_set_tex_filter(old_filter);