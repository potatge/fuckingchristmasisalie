switch (reindeerStates){
	
	case reindeer.mad:
	sprite_index = s_reindeer_mad_idle;
	break;
	
	case reindeer.happy:
		sprite_index = s_reindeer_happy_idle;
		
		if (!animPlay){
			if !audio_is_playing(snd_animalcry01){
				audio_play_sound(snd_animalcry01,1,0);
			}
			image_alpha -= fade;
			show_debug_message("alpha: "+string(image_alpha))
		}
		
		if (image_alpha <= 0){
			animPlay = true;
			//audio_play_sound(snd_animalcry01,1,0);
			instance_activate_object(cutscene_door3);
			setState(gamestates.allOverRedRover)
			instance_destroy();
		}
		
		break;
	
}





