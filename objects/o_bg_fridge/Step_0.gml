if (!instance_place(x,y,o_player)){
	 sprite_index = s_bg_fridge_closed;
}else{ 
	if (o_ctrl.decisionLVL == 0) {
    sprite_index = s_bg_fridge_open_full;
    if (global.state == gamestates.everythingsFine) {
      global.state = gamestates.goToFridge;
    }
  } else {
  sprite_index = s_bg_fridge_open_empty;
}
}