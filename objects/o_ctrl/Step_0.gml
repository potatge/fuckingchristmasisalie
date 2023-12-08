//get fullscreen
if keyboard_check_pressed(ord("F")) {
  if window_get_fullscreen() {
    window_set_fullscreen(false);
  } else {
    window_set_fullscreen(true);
  }
}

if (global.debugMode){
	if keyboard_check_pressed(vk_end){
		room_restart()
	}
}

switch (global.gameMode) {

case mode.playing:
  //global.playerCanMove = true;
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

  //switch within OPTIONS WOAH
  switch (decisionLVL) {

  case 0:
    Opt[0] = "MILK n COOKIES";
    Opt[1] = "WHITE WINE"

    break

  case 1:
    Opt[0] = "PUT UNDER TREE";
    Opt[1] = "DON'T";

    break;

  case 2:
    Opt[0] = "PUT UNDER TREE";
    Opt[1] = "DON'T";
    break;
  }

  //TODO GENERALISING FOR MANY OPTIONs
  if keyboard_check_pressed(vk_enter) {
    //TODO make this SWITCH
    if (curOption == 0) {
      show_debug_message("choose milk?")
      global.goodEnd = true;
    }

    if (curOption == 1) {
      show_debug_message("choose WINE")
      global.goodEnd = false;
    }
    decisionLVL += 1;
    global.gameMode = mode.playing;
    setState(gamestates.doneWithFridge)

  }

  break;

case mode.optionsSelected:
  show_debug_message("back to playing")
  global.gameMode = mode.playing;
  break;

case mode.gameOver:
  resetGameOnKeyPress();
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

  break;

case gamestates.fridgeSelection:
  global.gameMode = mode.options;
  setState(gamestates.fridgeSelected);

  break;

case gamestates.fridgeSelected:

  show_debug_message("show fridge end text?")
  global.playerCanMove = false;
  break;

case gamestates.doneWithFridge:
global.playerCanMove = true;
  instance_activate_object(cutscene_checkondamien);
  setState(gamestates.damienDisappears);
  show_debug_message("show text for fridge! check on damien, he's gone.");
  break;

case gamestates.damienDisappears:
  o_chara_damien.damienStates = states.hidden;
  break;

case gamestates.firstPresent:
  
  
  break;

case gamestates.boxesGone:
  // cutscene_boxpile.name_ = "cutscene_boxesgone";
  o_chara_damien.damienStates = states.hurt;

  break;

case gamestates.talkToDamien:
  break;

case gamestates.secondPresentAppears:
  instance_activate_object(cutscene_secondpresent);
  var present2 = instance_create_layer(970, 136, "Instances", o_item_present)
  with(present2) {
    name_ = "present2";
  }
  show_debug_message("present2 appears")
  break;

case gamestates.bloodSplodge:
  break;

case gamestates.lightsOut:
  // make one damien and hide him
  var damien = instance_create_layer(73, 974, "Instances", o_chara_damien)
  with(damien) {
    name_ = "damien3";
    damienStates = states.hidden2;
  }
  setState(gamestates.santaThere);
  show_debug_message("delete boxes an make damien and santa appears")

  break;

case gamestates.santaThere:
  instance_activate_object(cutscene_boxpile2);
  instance_activate_object(o_santa);
  instance_activate_object(cutscene_santareveal)

  instance_deactivate_object(cutscene_lightsout);

  break;

case gamestates.santaActivated:
  setState(gamestates.chaseBegins);
  show_debug_message("santa activated. chase begins. DUH.")

  break;

case gamestates.chaseBegins:
  instance_deactivate_object(cutscene_boxpile2)
  instance_deactivate_object(cutscene_santareveal);
  break;
  
  case gamestates.endRunAwayFaceDoor1:
      //sort out key presisng doubling up.
	  
	  o_ctrl.Opt[0] = "STAY";
	  o_ctrl.Opt[1] = "RUN"
	  global.gameMode = mode.options;
	  setState(gamestates.endRunAwayFaceDoor2)
	  break;

	   case gamestates.endRunAwayFaceDoor2:
	   if keyboard_check_pressed(vk_space){
		setState(gamestates.endRunAwayCompleted);
		global.gameMode = mode.optionsSelected
	  }
	  
	  break;
	case gamestates.endRunAwayCompleted:
	   resetGameOnKeyPress()
	   break;

}