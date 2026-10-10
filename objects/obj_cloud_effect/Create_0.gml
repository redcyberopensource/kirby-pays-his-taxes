// ---- Area (room coordinates) ----
var margin = 200;                        // extra on each side so edges never show
area_x = -margin;
area_w = room_width + margin * 2;
area_y = y;                         // far edge (top), uses the instance's y
area_h = 200 - y;           // runs to the bottom of the room

// ---- Look ----
tile_px = 512;       // size of one cloud tile in pixels at the near edge (bigger = bigger clouds)
horizon = 0.12;      // 0.05..0.5, lower = stronger perspective / more squashed far edge
depth_tiles = 1.2;   // how stretched the clouds are front to back (lower = more stretched)
fade_power = 0.7;    // how quickly the far edge fades out (higher = fades more)
strips = 48;         // more = smoother perspective

// ---- Scrolling ----
scroll_u = 0;
scroll_v = 0;
speed_u = 0;    // sideways drift
speed_v = -0.004;    // toward the viewer (negative = away)

// ---- Standalone texture so tiling works ----
cloud_surf = -1;
cloud_get_tex = function() {
    if (!surface_exists(cloud_surf)) {
        cloud_surf = surface_create(sprite_get_width(spr_red_clouds), sprite_get_height(spr_red_clouds));
        surface_set_target(cloud_surf);
        draw_clear_alpha(c_black, 0);
        draw_sprite(spr_red_clouds, 0, 0, 0);
        surface_reset_target();
    }
    return surface_get_texture(cloud_surf);
};