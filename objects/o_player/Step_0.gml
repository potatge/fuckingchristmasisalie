// Get player position and speed
var player_x = x;
var player_y = y;
var hspd = 0;
var vspd = 0;

// have we hit something?
var cut = instance_place(x, y, cutscene);
var item = findInteractable(x, y, [o_interactable, o_chara]);
// tilemap_get_at_pixel returns a real number. 0 means no collision.
var wall_at_next_position = tilemap_get_at_pixel(layer_tilemap_get_id("walls"), x, y);
var collision = (item != noone || wall_at_next_position != 0);

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
      Facing = facing.left;
      image_xscale = 1;
      sprite_index = s_chara_girl_left;
    }

    if (keyboard_check_direct(vk_up)) {
      Facing = facing.up;
      vspd -= spd;
      sprite_index = s_chara_girl_up;
    }

    if (keyboard_check_direct(vk_right)) {
      Facing = facing.right;
      hspd += spd;
      image_xscale = -1;
      sprite_index = s_chara_girl_left;
    }

    if (keyboard_check_direct(vk_down)) {
      Facing = facing.down;
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



var space = keyboard_check_pressed(vk_space);
if (space && resetOnSpace) {
  resetTextToNone();
  bounceBack(3);
  resetOnSpace = false;
  return;
}

if (space && item != noone) {
  if (!showItemDialogue(item)) {
    resetOnSpace = true;
  }
  //  return;
}

// Show dialog for cut scene if we're in a cut scence,
// else if we were in a cut scene then reset the dialog.
if (cut != noone) {
  inCutscene = true;
  showCutDialogue(cut);
} else {
  if (inCutscene) {
    resetTextToNone();
    inCutscene = false
  }
}

if (!collision) {
  x += hspd;
  y += vspd;
  return;
}

// else collision
if (item != noone || cut != noone) {
  // collision with item or cutscene. don't bounce.
  return;
}

bounceBack(3);
//global.playerCanMove = true;