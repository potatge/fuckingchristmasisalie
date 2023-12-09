function findItem(name_) {
  for (var i = 0; i < array_length(global.interactables); i++) {
    if (global.interactables[i].name_ == name_) {
      return global.interactables[i];
    }
  }
  return noone
}

function findInteractable(myX, myY, object) {

  var interact = instance_place(myX, myY, object)
  if (interact) {
    for (var i = 0; i < array_length(global.interactables); i++) {
      if (global.interactables[i].name_ == interact.name_) {
        return global.interactables[i];
      }
    }
  }
  return noone;
}

function resetTextToNone() {
  with(o_ctrl) {
    showText = false;
    moreTextAvailible = false;
    curText = 0;
    portraitDraw = false;
  }
}

function fridgeEndAction(fridge) {

  if (global.goodEnd) {
    o_ctrl.myText = fridge.endText[0];
  } else {
    o_ctrl.myText = fridge.endText[1];
  }
  o_ctrl.moreTextAvailible = true;
  o_ctrl.showText = true;

}

function present1EndAction(present1) {
  with (o_item_present){
	if (name_ == "present1"){
		instance_deactivate_object(cutscene_checkondamien);
		instance_activate_object(cutscene_screamindistance);
		setState(gamestates.screamInDistance); 
		with (cutscene_boxpile){
			instance_change(cutscene_boxpile1gone,true)
		}
		setState(gamestates.boxesGone)
		instance_destroy();
	}
  }
 
}

function present2EndAction(present2) {
  show_debug_message("present2 endaction");
  with (o_item_present){
	if (name_ == "present2"){
		instance_destroy();
	}
   }
}

function setState(state) {
  global.state = state;
  show_debug_message("setting games state to:" + string(o_ctrl.gamestatesStrings[state]))
  //show_debug_message(gameStateString[])
}

function damienRescueEndAction(damien3) {
  //show_debug_message("rescue damnien endaction");
  o_chara_damien.damienStates = states.followher;
  global.goodEnd = true; 
}


function doorEndaction(door){
	
}
	
function resetGameOnKeyPress(){
	global.playerCanMove = false;
    if keyboard_check_pressed(vk_space) {
	global.playerCanMove = true;
	goToRoom(rm1,259,127)
    room_restart();
    setState(gamestates.everythingsFine);
    global.gameMode = mode.playing;
    lightsOut = false;
    audio_stop_sound(music_suspense);
    curSong = music_holidays;
  }	
}


function screenshake(_time, _magnitude, _fade){
   with (o_sfx_screenshake)
   {
      shake = true;
      shake_time = _time;
      shake_magnitude = _magnitude;
      shake_fade = _fade;
   }
}

function goToRoom(rooom,xx,yy){
	
	global.xcoord = xx;
	global.ycoord = yy;
	room_goto(rooom);
	
}