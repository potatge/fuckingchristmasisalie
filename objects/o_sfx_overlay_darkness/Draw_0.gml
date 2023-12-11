var c = make_colour_rgb(56, 56, 71);
gpu_set_blendmode(bm_subtract);
draw_sprite_stretched_ext(s_white,0,x,y,sprite_width,sprite_height,c,0.8)
//draw_rectangle_color(x, y,sprite_height,sprite_width, c, c, c, c, false);
gpu_set_blendmode(bm_add);
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);



