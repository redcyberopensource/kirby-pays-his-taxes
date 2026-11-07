// 1. Get the current camera X coordinate
var _cam_y = camera_get_view_y(view_camera[view_current]);

// 2. Shift background positions by unique multipliers
// Lower numbers move slower (looks further away). Higher numbers move faster (looks closer).
layer_y(bg[0], _cam_y * 0.55 + room_height-400);       // Moves extremely slow