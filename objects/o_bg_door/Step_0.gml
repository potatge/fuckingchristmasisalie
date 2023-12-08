if (place_meeting(o_player.x,o_player.y,o_bg_door) && o_ctrl.decisionLVL == 1){
	sprite_index = s_bg_door_open;
	setState(gamestates.endRunAwayFaceDoor1)
	//setState(gamestates.endRunAwayFaceDoor1);
	show_debug_message("engaging with door");
	}else{
	sprite_index = s_bg_door;
}