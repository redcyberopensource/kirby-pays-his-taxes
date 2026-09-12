global.lives++
global.oneups++
if (global.can_play_music) with obj_music alarm[0] = 420
audio_stop_sound(global.current_music)
audio_play_sound(snd_1up, 1, false)
instance_destroy()