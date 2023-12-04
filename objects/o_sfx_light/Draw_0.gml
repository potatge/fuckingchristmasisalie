if (o_ctrl.lightsOut){
	gpu_set_blendmode(bm_add)
	//gpu_set_blendmode(bm_normal);
	draw_set_alpha(0.3)
	draw_self();
}




