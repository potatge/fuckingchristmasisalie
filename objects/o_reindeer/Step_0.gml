switch (reindeerStates){
	
	case reindeer.mad:
		sprite_index = s_reindeer_mad_idle;
		break;
		
	case reindeer.roar:
	sprite_index = s_reindeer_roar;
	if (alarm[1]<= 0){
		alarm[1]=100;
		//roar for 100 then back to normal.
	}
	break;
	
	case reindeer.eat:
		sprite_index = s_reindeer_eat;
		// eats for 100 steps then is happy. 
		if (alarm[0] <= 0 && !anim1Play){
			alarm[0] = 100;
			anim1Play = true;
		}
		break;
	
	case reindeer.happy:
		sprite_index = s_reindeer_happy_idle;
		
		if (!anim2Play){
			if !audio_is_playing(snd_animalcry01){
				audio_play_sound(snd_animalcry01,1,0);
			}
			image_alpha -= fade;
			show_debug_message("alpha: "+string(image_alpha))
		}
		
		if (image_alpha <= 0){
			anim2Play = true;
			instance_create_layer(0,0,"Instances_top",o_black_transition)
			//audio_play_sound(snd_animalcry01,1,0);
			instance_destroy();
		}
		
		break;
	
}





