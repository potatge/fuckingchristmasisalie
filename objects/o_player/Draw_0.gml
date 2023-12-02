gpu_set_blendmode(bm_add);
draw_set_alpha(0.4);
draw_sprite(s_sfx_lightsource,0,x,y)
gpu_set_blendmode(bm_normal);
draw_self();