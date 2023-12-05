if (instance_place(x,y,o_player) && global.state == gamestates.everythingsFine){
	sprite_index= s_bg_fridge_open_full;
	global.state = gamestates.goToFridge;
		
}
	
else {
	sprite_index = s_bg_fridge_closed;
}

