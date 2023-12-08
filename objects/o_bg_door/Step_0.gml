if place_meeting(o_player.x,o_player.y,o_bg_door){
	sprite_index = s_bg_door_open;
	show_debug_message("engaging with door");
}else{
	sprite_index = s_bg_door;
}