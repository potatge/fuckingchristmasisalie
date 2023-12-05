
switch (santaStates){
	
	case santa.idle:
	sprite_index = s_santa_left;
	break;
	
	case santa.awakened:
	sprite_index = s_santa_down;
	
	break;
	
	case santa.pathstart:
	path_start(p_santa,spd,path_action_reverse,false);
	santaStates = santa.onpath;
		break;
	case santa.onpath:
	break;
	
	case santa.attacking:
	break;
	
	
}


