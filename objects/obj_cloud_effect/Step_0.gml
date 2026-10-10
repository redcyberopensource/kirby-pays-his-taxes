var dt = delta_time / 16666;
scroll_u = (scroll_u + speed_u * dt) mod 1;
scroll_v = (scroll_v + speed_v * dt) mod 1;