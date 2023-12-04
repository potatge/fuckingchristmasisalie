if (instance_place(x, y, o_player) && global.cutscene == 0) {
  global.state = gamestates.boxesGone;
  scr_stingerSound()
    
}

switch (damienStates){
	
	case states.normal:
	sprite_index = s_char_damien_idle
	break;
	
	case states.hurt:
	sprite_index = s_chara_damien_collapsed;
	break;
	
	
	
}