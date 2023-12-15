// Get player position and speed
var player_x = x;
var player_y = y;
var hspd = 0;
var vspd = 0;

switch (playerState) {

case player.alive:

	  if (!global.playerCanMove) {
	    sprite_index = s_chara_girl_thinking;
	    return;
	  }

	  if (keyboard_check_direct(vk_left) ||
	    keyboard_check_direct(vk_right) ||
	    keyboard_check_direct(vk_up) ||
	    keyboard_check_direct(vk_down)) {

	    if (global.audio == true) {
	      if !audio_is_playing(snd_footstep01) {
	        audio_play_sound(snd_footstep01, 1, 0);
	      }
	    }
	  }

	  image_speed = 1;

	  //else, be alive and move.
	  if (keyboard_check_direct(vk_left)) {
	    hspd -= spd;
	    facing = 1;
	    image_xscale = 1;
	    sprite_index = s_chara_girl_left;
	  }

	  if (keyboard_check_direct(vk_up)) {
	    facing = 2;
	    vspd -= spd;
	    sprite_index = s_chara_girl_up;
	  }

	  if (keyboard_check_direct(vk_right)) {
	    facing = 3;
	    hspd += spd;
	    image_xscale = -1;
	    sprite_index = s_chara_girl_left;
	  }

	  if (keyboard_check_direct(vk_down)) {
	    facing = 4;
	    vspd += spd;
	    sprite_index = s_chara_girl_down;
	  }

	  // revert back to idle
	  if (keyboard_check_released(vk_left)) {
	    sprite_index = s_chara_girl_left_idle;
	    image_xscale = 1;
	  }

	  if (keyboard_check_released(vk_right)) {
	    sprite_index = s_chara_girl_left_idle;
	    image_xscale = -1;
	  }

	  if (keyboard_check_released(vk_down)) {
	    sprite_index = s_chara_girl_down_idle;
	  }
	  if (keyboard_check_released(vk_up)) {
	    sprite_index = s_chara_girl_up_idle;
	  }

	 break;

case player.dead:
  sprite_index = s_chara_girl_faint;
  screenshake(30, 5, 0.2);
  playerState = player.dead2;
  break;

case player.dead2:
  sprite_index = s_chara_girl_faint;
  break;

}

// else {
//  if (playerState != player.dead2) {
//   sprite_index = s_chara_girl_thinking;
// }
//}

//// keep in room?
clamp(x, 0, room_width);
clamp(y, 0, room_height);

//collisions 
var cam_id = view_camera[0];

//collisions 
//var obstacles = instance_place(x, y, [o_interactable, o_chara])
var collision_at_next_position = check_wall_collision(player_x + hspd, player_y + vspd);
//var obstacle_at_next_position = instance_place(player_x + hspd, player_y + vspd, obstacles);
//obstacle_at_next_position != noone ||
if (collision_at_next_position != -1) {
 hspd = 0;
 vspd = 0;
} else {
  x += hspd;
  y += vspd;

}

// mood portraits


switch (claireMood) {
case mood.happy:
  clairePortrait = s_char_portraits_claire_happy;
  break;

case mood.worried:
  clairePortrait = s_char_portraits_claire_worried;
  break;

case mood.determined:
  clairePortrait = s_char_portraits_claire_determined;
  break;

}

//cutscene 
var cut = instance_place(x, y, cutscene)

var item = findInteractable(x, y, [o_interactable, o_chara]);

if (item == noone && cut == noone) {
  resetTextToNone();
  return;
}

//dialogue system. needs to be at bottom rn.
if (keyboard_check_pressed(vk_space) && item != noone) {

  var cur = o_ctrl.curText;
  var textall = array_length(item.myText);

  if (cur < textall) {

    o_ctrl.showText = true;
    if (cur == textall - 1) {
      o_ctrl.moreTextAvailible = false;
    } else {
      o_ctrl.moreTextAvailible = true;
    }
    o_ctrl.myText = item.myText[o_ctrl.curText];
    o_ctrl.curText++

    //if no speaker, no portraits.
    if (!item.isSpeaker) {
      return;
    } else {
      o_ctrl.portraitDraw = true;
      global.curSpeakerLeft = clairePortrait;
      global.curSpeakerRight = item.portrait;
    }
  } else {

    //if (item.hasOption) {
    //  global.gameMode = mode.options;
    // }

    if (item.endAction) {
      item.endAction(item);
    } else {
      resetTextToNone();
    }
  }
}

if (cut != noone && !cut.frozePlayerForCutscene && cut.freezePlayer) {
  if (cut.alarm[1] <= 0) {
    cut.alarm[1] = 100;
    global.playerCanMove = false;
    o_ctrl.myText = cut.myText;
    o_ctrl.showText = true;
    o_ctrl.moreTextAvailible = true;
  }
}