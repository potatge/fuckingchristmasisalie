//get fullscreen
if keyboard_check_pressed(ord("F")) {
  if window_get_fullscreen() {
    window_set_fullscreen(false);
  } else {
    window_set_fullscreen(true);
  }
}

if (global.debugMode) {
  if (keyboard_check_pressed(vk_delete)) {
    room_restart()
  }
}

switch (global.gameMode) {

case mode.playing:
  global.playerCanMove = true;
  break;

case mode.options:
  sprite_index = s_chara_girl_thinking;
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
    Opt[0] = "GRAB CARROT";
    Opt[1] = "BE SILLY AND DON'T DO ANYTHING.";

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
		if (global.state == gamestates.kitchenSelecting){
			setState(gamestates.kitchenSelected);
		}

    }

    if (curOption == 1) {
    }
    //decisionLVL += 1;
    if (global.audio) {
      audio_play_sound(snd_blip01, 1, 0)
    }
 
 // TODO WILL BREAK GAME? get it going to next state
    if (global.state == gamestates.fridgeSelected) {
      setState(gamestates.doneWithFridge);
    }
   
	
	

   global.gameMode = mode.playing;
  }

  break;

case mode.optionsSelected:
  global.gameMode = mode.playing;
  break;

case mode.gameOver:
  resetGameOnKeyPress();
  break;

}

if (global.audio) {
  if (!audio_is_playing(curSong)) {
    audio_play_sound(curSong, 1, true);
  }

  if (!audio_is_playing(snd_stinger01)) {
    audio_resume_sound(curSong);
    // o_ctrl.musicPlay = true;
  }
} else {
  audio_pause_all()
}

switch (room) {

case rm_title:

  if keyboard_check_pressed(vk_tab) {
    global.audio = !global.audio;
    show_debug_message("global.audio: " + string(global.audio))
  }

  if keyboard_check_pressed(vk_space) {
    instance_create_layer(x, y, "Instances", o_black_transition);
  }

  break;

case rm1:
  break;

}

switch (global.state) {

case gamestates.everythingsFine:
  break;

case gamestates.goToFridge:

  break;

case gamestates.fridgeSelection:
  //global.gameMode = mode.options;
  setState(gamestates.doneWithFridge);

  break;

case gamestates.fridgeSelected:
  //global.playerCanMove = false;
  break;

case gamestates.doneWithFridge:
  global.playerCanMove = true;
  instance_activate_object(cutscene_checkondamien);
  setState(gamestates.damienDisappears);
  break;

case gamestates.damienDisappears:
  o_chara_damien.damienStates = states.hidden;
  show_debug_message("where is he?:"+string(o_chara_damien.x));
  break;

case gamestates.firstPresent:

  break;

case gamestates.screamInDistance:

  break;

case gamestates.boxesGone:
//TODO FUCKIG CUTSCENE NOT DEACTIVATE
setState(gamestates.talkToDamien);
 instance_deactivate_object(cutscene_checkondamien);
  //cutscene_boxpile.name_ = "cutscene_boxesgone";
  o_chara_damien.damienStates = states.hurt;
  break;

case gamestates.talkToDamien:
  //setState(gamestates.secondPresentAppears);
  break;

case gamestates.secondPresentAppears:
  instance_destroy(o_item_keys);
  instance_deactivate_object(cutscene_screamindistance);
  //instance_activate_object(cutscene_secondpresent);
  var present2 = instance_create_layer(970, 136, "Instances", o_item_present);
  with(present2) {
    name_ = "present2";
  }
  break;

case gamestates.bloodSplodge:
  break;

case gamestates.lightsOut:
  var damien = instance_create_layer(73, 974, "Instances", o_chara_damien);
  with(damien) {
    name_ = "damien3";
    damienStates = states.cellar;
  }
  o_player.claireMood = mood.determined;
  setState(gamestates.santaThere);

  break;

case gamestates.santaThere:
  instance_activate_object(cutscene_boxpile2);
  instance_activate_object(o_santa);
  instance_activate_object(cutscene_santareveal);

  instance_deactivate_object(cutscene_lightsout);

  break;

case gamestates.santaActivated:
  setState(gamestates.chaseBegins);

  break;

case gamestates.chaseBegins:
  instance_deactivate_object(cutscene_santareveal);
  instance_activate_object(cutscene_door1);
  instance_deactivate_object(cutscene_boxpile2);
  setState(gamestates.thirdPresentAppears);
  break;

case gamestates.thirdPresentAppears:

  var present3 = instance_create_layer(702, 792, "Instances", o_item_present);
  with(present3) {
    name_ = "present3";
    sprite_index = s_item_present3;
  }

  break;

case gamestates.keyObtained:
  instance_deactivate_object(cutscene_door1);
  instance_activate_object(cutscene_door2);
  break;

case gamestates.reindeerAppears:
  screenshake(20, 3, 0.3);
  o_player.y += 32;
  instance_create_layer(o_bg_door.x, o_bg_door.y + 16, "Instances_top", o_reindeer);
  with(o_bg_door) {
    sprite_index = s_bg_door_open;
  }
  with(o_bg_kitchenarea) {
    name_ = "kitchenarea2";
  }
  o_ctrl.decisionLVL += 1;
  setState(gamestates.reindeerBlocksDoor);
  break;

case gamestates.reindeerBlocksDoor:
  //consistent state of it blocking door.
  break;

case gamestates.kitchenSelecting:
  show_debug_message("should get OPTIONS");
    
	//global.gameMode = mode.options;
	break;

case gamestates.kitchenSelected:
	setState(gamestates.hasCarrot);
  //global.gameMode = mode.optionsSelected;
  break;

case gamestates.hasCarrot:
  var deer = findItem("reindeer")
  deer.myText = ["This should do the trick."]
  instance_deactivate_object(cutscene_door3)
  // draw sprite of carrot in player obj.
  break;

case gamestates.givesCarrot:
  o_reindeer.reindeerStates = reindeer.eat;
  setState(gamestates.givenCarrot)
  break;

case gamestates.givenCarrot:
  break;

  //death state 
case gamestates.youDied:
  resetGameOnKeyPress();
  break;

  /// endings 
case gamestates.allOverRedRover:
  resetGameOnKeyPress();
  break;

}