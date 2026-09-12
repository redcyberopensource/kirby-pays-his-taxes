var _count = 40; // how many to spawn

with obj_moon_guy alarm[4] = 20

for (var i = 0; i < _count; i++) {
    var a = instance_create_depth(x, y, -1, obj_cherry);
    a.sprite_index = spr_cherry_nocolor;
    a.image_blend = c_gray;
    a.hspeed = random_range(-8, 8);
    a.gravity = 0.2
	a.vspeed = random_range(-3, -12)
}