
if (cutscene.scene3){
	gpu_set_blendmode(bm_add);
	draw_set_alpha(0.3);
	draw_sprite(s_sfx_lightsource,0,x,y)
	gpu_set_blendmode(bm_normal);

}


draw_set_alpha(1);
draw_sprite(s_char_shadow,0,x,y)
draw_self();
