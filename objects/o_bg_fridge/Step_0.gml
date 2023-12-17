/*if (!instance_place(x,y,o_player)){
	 sprite_index = s_bg_fridge_closed;
}else{ 
    sprite_index = s_bg_fridge_open_full;
    if (global.state == gamestates.everythingsFine) {
      setState(gamestates.fridgeSelection);
    }
}
//else {
//  sprite_index = s_bg_fridge_open_empty;