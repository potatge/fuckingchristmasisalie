var c = make_colour_rgb(56, 56, 71);
gpu_set_blendmode(bm_subtract);
draw_sprite_stretched_ext(s_white,0,x,y,sprite_width,sprite_height,c,0.8);
gpu_set_blendmode(bm_add);
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);



