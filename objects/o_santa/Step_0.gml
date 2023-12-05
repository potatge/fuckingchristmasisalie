
switch (santaStates){
	
	case santa.idle:
		sprite_index = s_santa_up;
	
	break;
	
	case santa.awakened:
		sprite_index = s_santa_left 
		image_index = -1;
		if (alarm[0] <= 0){
			alarm[0] = 60;
		}
		break;
	
	case santa.pathstart:
		sprite_index = s_santa_up;
		image_index = 1;
		path_start(p_santa,spd,path_action_reverse,false);
		santaStates = santa.onpath;
		break;
		
	case santa.onpath:
		break;
	
	case santa.attacking:
		break;
	
	
}


