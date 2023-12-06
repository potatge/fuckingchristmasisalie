//get fullscreen
if keyboard_check_pressed(ord("F")) {
  if window_get_fullscreen() {
    window_set_fullscreen(false);
  } else {
    window_set_fullscreen(true);
  }
}

switch (decisionLVL){
	
	case 0:
		Opt[0] = "MILK n COOKIES";
		Opt[1] =  "WHITE WINE"
		break
	
	case 1:
		Opt[0] = "GRAB";
		Opt[1] = "DON'T GRAB";
		break;

}

switch (global.gameMode) {

case mode.playing:
  global.playerCanMove = true;
  break;

case mode.options:
    global.playerCanMove = false;
    if keyboard_check_pressed(vk_down) {
      curOption++
    }
    if keyboard_check_pressed(vk_up) {
      curOption--
    }
	
    if (curOption > maxOption) {
      curOption = 0
    }


    //TODO GENERALISING FOR MANY OPTIONs
    if keyboard_check_pressed(vk_enter) {

	  decisionLVL += 1;
      global.gameMode = mode.playing;
  
    }

  break;

case mode.optionsSelected:
  show_debug_message("back to playing")
  global.gameMode = mode.playing;
  break;

}

switch (room) {

case rm_title:
  // only do this if not in option mode. TODO make nice menu.
  if global.gameMode != mode.options && keyboard_check_pressed(vk_space) {
    room_goto(rm1)
  }
  break;

case rm1:
  //music and sfx playing 

  if (musicPlay && !audio_is_playing(curSong)) {
    audio_play_sound(curSong, 1, true)
  }
  if (!audio_is_playing(snd_stinger01)) {

    audio_resume_sound(curSong);
    o_ctrl.musicPlay = true;
  }

  break;

}

switch (global.state) {

case gamestates.everythingsFine:
  break;

case gamestates.goToFridge:
  instance_activate_object(cutscene_checkondamien);
  global.state = gamestates.damienDisappears;
  show_debug_message("check on damien, he's gone.");
  break;

case gamestates.damienDisappears:
  o_chara_damien.damienStates = states.hidden;
  break;

case gamestates.firstPresent:
  with(o_item_present) {
    if (name_ == "present1") {
      x = 64;
      y = 454;
    }
  }
  break;

case gamestates.boxesGone:
  cutscene_boxpile.name_ = "cutscene_boxesgone";
  o_chara_damien.damienStates = states.hurt;

  break;

case gamestates.talkToDamien:
  show_debug_message("talk to dam")
  break;

case gamestates.secondPresentAppears:
  instance_activate_object(cutscene_secondpresent);
  with(o_item_present) {
    if (name_ == "present2") {
      x = 970;
      y = 136;
    }
  }
  break;

case gamestates.bloodSplodge:
  break;

case gamestates.lightsOut:
  instance_activate_object(cutscene_boxpile2)
  // make one damien and hide him
  var damien = instance_create_layer(73, 974, "Instances", o_chara_damien)
  with(damien) {
    name_ = "damien3";
    damienStates = states.hidden2;
  }
  global.state = gamestates.santaThere;
  show_debug_message("delete boxesm make damien and santa appears")

  break;

case gamestates.santaThere:
  instance_activate_object(o_santa);
  instance_activate_object(cutscene_santareveal)
  instance_deactivate_object(cutscene_lightsout);

  break;

case gamestates.santaActivated:
  global.state = gamestates.chaseBegins;
  show_debug_message("santa activated. chase begins. DUH.")

  break;

case gamestates.chaseBegins:
  instance_deactivate_object(cutscene_boxpile2)
  instance_deactivate_object(cutscene_santareveal);
  break;
}