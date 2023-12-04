if (instance_place(x,y,o_player) && keyboard_check_pressed(vk_space)){
	toggleSprite = !toggleSprite
	
	if (global.state == gamestates.everythingsFine){
		//TODO  chooses wrong thing out of fridge.
		global.state = gamestates.goToFridge;
		show_debug_message("went to fridge")
	}

}
	
	//if global.state == gamestates.fridgeEmptied


if (toggleSprite){
	sprite_index = s_bg_fridge_open_full;
}else{
	sprite_index = s_bg_fridge_closed;
}