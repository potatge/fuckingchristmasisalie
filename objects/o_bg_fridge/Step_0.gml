if (instance_place(x,y,o_player)){
	
	if  (global.state == gamestates.everythingsFine){
		global.state = gamestates.goToFridge;
		
		}
		
		global.gameMode = mode.options;
}
	
else {
	sprite_index = s_bg_fridge_closed;
}

