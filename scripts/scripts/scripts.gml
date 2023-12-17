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
setState(gamestates.doneWithFridge)
fridge.sprite_index = s_bg_fridge_closed;
  /*if (global.goodEnd) {
    o_ctrl.myText = fridge.endText[0];
  } else {
    o_ctrl.myText = fridge.endText[1];
  }
  o_ctrl.moreTextAvailible = true;
  o_ctrl.showText = true;
  */

}

/*function doorEndaction(door){
	if (global.state = gamestates.keyObtained){
		setState(gamestates.allOverRedRover)
	}else{
		
		
	}
}
*/

function present1EndAction(present1) {
  with(o_item_present) {
    if (name_ == "present1") {
      instance_activate_object(cutscene_screamindistance);
      setState(gamestates.screamInDistance);
      with(cutscene_boxpile) {
        instance_change(cutscene_boxpile1gone, true)
      }
      setState(gamestates.boxesGone)
      instance_destroy();
    }
  }

}

function present2EndAction(present2) {
  show_debug_message("present2 endaction");
  with(o_item_present) {
    if (name_ == "present2") {

      setState(gamestates.bloodSplodge);

      with(o_chara_damien) {
        instance_change(o_sfx_blood, true)

      }
      instance_create_layer(o_sfx_blood.x - 32, o_sfx_blood.y, "Instances", o_item_letter)
      instance_deactivate_object(cutscene_boxpile1gone);
      instance_deactivate_object(cutscene_secondpresent);
      instance_destroy();

    }
  }
}

function present3EndAction(present3) {
  with(o_item_present) {
    if (name_ == "present3") {
      instance_destroy();
    }
    setState(gamestates.keyObtained)

    show_debug_message("present3 endaction. activate door2");

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

function letterEndaction(letter) {
  instance_activate_object(cutscene_lightsout);
  with(o_item_letter) {
    instance_destroy();
  }
}

function kitchenarea2Endaction(kitchenarea2) {
  o_bg_kitchenarea.sprite_index = s_bg_kitchenarea2_empty;
  setState(gamestates.hasCarrot);
}

function reindeerEndaction() {
  if (global.state == gamestates.hasCarrot) {
    setState(gamestates.givesCarrot);
  } else {
    o_reindeer.reindeerStates = reindeer.roar;
    if (global.audio && !audio_is_playing(snd_animalcry01)) {
      audio_play_sound(snd_animalcry01, 1, 0);
    }
  }
}

function resetGameOnKeyPress() {
  global.playerCanMove = false;
  if (keyboard_check_pressed(vk_space)) {
    room_goto(rm1)
    //playerGoToRoom(rm1, 259, 127);
    room_restart();

    setState(gamestates.everythingsFine);
    audio_stop_sound(music_suspense);

    global.gameMode = mode.playing;
    global.playerCanMove = true;
    global.goodEnd = false;
    o_player.playerState = player.alive;
    o_player.claireMood = mood.happy;

    //santa room set,
    // o_santa.santaStates = santa.idle;
    // o_santa.santaPath = path.notstarted;
    //player room set

    var damien2 = o_chara_damien_follow;
    if instance_exists(damien2) {
      with(damien2) {
        instance_change(o_chara_damien, true)
        damien2.damienStates = states.normal;
      }
    }
    lightsOut = false;
    curSong = music_holidays;
  }
}

function screenshake(_time, _magnitude, _fade) {
  with(o_sfx_screenshake) {
    shake = true;
    shake_time = _time;
    shake_magnitude = _magnitude;
    shake_fade = _fade;
  }
}

function playerGoToRoom(rooom, xx, yy) {
  with(o_player) {
    global.playerXcoord = xx;
    global.playerYcoord = yy;
    room_goto(rooom);
  }

}

// showItemDiaglogue shows the next dialog item.
// Returns true until all text, end actions (if any) performed.
function showItemDialogue(item) {
  if (item == noone) {
    show_debug_message("WARNING: showItemDialogue passed noone")
    return false;
  }

  var cur = o_ctrl.curText;
  var numText = array_length(item.myText);
  // Is there more text?
  if (cur < numText) {
    // Is there more text?
    if (cur == numText - 1) {
      // This is the last text.
      o_ctrl.moreTextAvailible = false;
    } else {
      o_ctrl.moreTextAvailible = true;
    }

    o_ctrl.showText = true;
    o_ctrl.myText = item.myText[o_ctrl.curText];
    o_ctrl.curText++

    // If no speaker, no portraits.
    if (item.isSpeaker) {
      o_ctrl.portraitDraw = true;
      global.curSpeakerLeft = clairePortrait;
      global.curSpeakerRight = item.portrait;
    }

    if (item.hasOption || item.endAction) {
      return true;
    }
    return o_ctrl.moreTextAvailible;
  }

  // Is there an option or end action?
  /*if (item.hasOption) {
    global.gameMode = mode.options;
  }
  */
  if (item.endAction) {
    item.endAction(item);
  }

  return false; // No more!
}

function showCutDialogue(cut) {
  if (cut == noone) {
    show_debug_message("WARNING: showCutDialogue passed noone")
    return;
  }
      global.playerCanMove = false;
      o_ctrl.myText = cut.myText;
      o_ctrl.showText = true;
      //o_ctrl.moreTextAvailible = true;

  return;
}

// bounce back given distance
function bounceBack(d) {
  show_debug_message("Facing = " + string(Facing))
  switch (Facing) {
  case facing.left:
    x += d;
    break;

  case facing.up:
    y += d;
    break;

  case facing.right:
    x -= d;
    break;

  case facing.down:
    y -= d;
    break;
  }

}