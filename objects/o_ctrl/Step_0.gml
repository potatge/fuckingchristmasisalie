//get fullscreen
if keyboard_check_pressed(ord("F")){
    if window_get_fullscreen(){
        window_set_fullscreen(false);
    }else {
        window_set_fullscreen(true);
   }
}


if keyboard_check_pressed(vk_enter){
	room_restart();
}

switch (room){
	
	case rm_title:
		if keyboard_check_pressed(vk_space){
			room_goto(rm1)
		}
	break;
	
	case rm1:

	}
		
		
		

	// do nothing
	break;
	

}
// sounds and music.
switch (sounds){
	
	


}

	
switch global.state{
	
case gamestates.boxesExist:

	break;
	
case gamestates.boxesGone:
	cutscene_boxpile.name_  = "cutscene_boxesgone"
	break;

case gamestates.bloodSplodge:
		with(o_chara_damien) {
			instance_change(o_sfx_blood, true)
		}
		instance_activate_object(cutscene_lightsout);
		instance_deactivate_object(cutscene_boxpile);
	break;
	
case gamestates.lightsOut:
	o_ctrl.lightsOut = true;
	//does this automatically so no
	//instance_deactivate_object(cutscene_lightsout);
	break;
}