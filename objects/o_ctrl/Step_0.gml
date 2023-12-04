//get fullscreen
if keyboard_check_pressed(ord("F")){
    if window_get_fullscreen(){
        window_set_fullscreen(false);
    }else {
        window_set_fullscreen(true);
   }
}


if keyboard_check_pressed(vk_enter){
	room_restart();
}

switch (room){
	
	case rm_title:
		if keyboard_check_pressed(vk_space){
			room_goto(rm1)
		}
	break;
	
	case rm1:
	if (!musicPlay){
		audio_play_sound(music_holidays,1,1)
		musicPlay = true;
	}
	// do nothing
	break;
	
	
}

if (o_ctrl.musicPlay){
		audio_pause_sound(music_holidays);
		audio_play_sound(snd_stinger01,1,0);
		o_ctrl.musicPlay = false;
		if (!audio_is_playing(snd_stinger01)){
			audio_resume_sound(music_holidays)
		}
	}
	
switch global.state{
	
case gamestates.boxesExist:

	break;
	
case gamestates.boxesGone:
	musicPlay = true;
	cutscene_boxpile.name_  = "cutscene_boxesgone"
	break;

case gamestates.bloodSplodge:
	musicPlay = true;
		with(o_chara_damien) {
			instance_change(o_sfx_blood, true)
		}
		instance_activate_object(cutscene_lightsout);
		instance_deactivate_object(cutscene_boxpile);
	break;
	
case gamestates.lightsOut:
	musicPlay = true;
	o_ctrl.lightsOut = true;
	//does this automatically so no
	//instance_deactivate_object(cutscene_lightsout);
	break;
}