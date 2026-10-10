///@desc Reset All Veriables
spr_jump = spr_jump_default;
spr_fall = spr_fall_default;
spr_idle = spr_idle_default;
spr_walk = spr_walk_default;
spr_run = spr_run_default;
hsp_max = 3
can_use_ability = true
mouth_full = false
burning = false
sword_dash = false;
instance_destroy(obj_cutter_dash_hitbox)
instance_destroy(obj_fire_burning_hit)
instance_destroy(obj_sword_slash_hit)
instance_destroy(obj_sword_upwards_hit)
instance_destroy(obj_smash_spin_hitbox);
acc = 0.2
grv = current_grv;
cutter_dash = false;
can_move = true;
can_dash = true;
can_float = true;
can_turn = true;
float = false;
ninja_dive = false;
ninja_dash = false;
smash_jab = false;
smash_hammer = false;
smash_spin = false;
image_angle = 0;
rot = 0;
if (room = rm_crack_screen) instance_destroy()