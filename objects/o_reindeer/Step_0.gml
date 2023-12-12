
switch (reindeerStates){
	
	case reindeer.mad:
	sprite_index = s_reindeer_mad_idle;
	break;
	
	case reindeer.happy:
	
	sprite_index = s_reindeer_happy_idle;
	
	if (alarm[0] <= 0){
		//set alarm. slowly fades and destroy.
		image_alpha -= fade;
		alarm[0] = 200;
	}
	break;
	
}





