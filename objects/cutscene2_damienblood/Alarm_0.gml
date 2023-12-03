global.playerCanMove = true;
with(o_chara_damien) {
	instance_change(o_sfx_blood, true)
}
//global.cutscene += 1;
show_debug_message("cutscene:" + string(global.cutscene))
//instance_activate_object(cutscene3_lightsout);