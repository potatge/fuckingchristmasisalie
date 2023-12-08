switch (santaStates) {

case santa.idle:
  sprite_index = s_santa_up;
  if (global.state == gamestates.santaActivated) {
    santaStates = santa.awakened;
  }

  break;

case santa.awakened:
  //play anim
  show_debug_message("play anim. freeze chara! & alarm for 100")
  image_xscale = -1;
  sprite_index = s_santa_left_idle

  if (alarm[0] <= 0) {
    image_speed = 1;

    alarm[0] = 100;
    global.playerCanMove = false

  }
  break;

case santa.pathstarted:
  global.playerCanMove = true;
  show_debug_message("path started")
  santaStates = santa.onpath;
  break;

case santa.onpath:
  var left = 0;
  var right = 180;
  var up = 90;
  var down = 270;
  //directional santa 
  if (direction >= left && direction < up) {
    show_debug_message("up left")
    image_xscale = -1;
    sprite_index = s_santa_left_move;
  }

  if (direction >= up && direction < 180) {
    show_debug_message("up right")
    sprite_index = s_santa_up;
    image_xscale = 1;
  }

  if (direction >= right && direction < down) {
    show_debug_message("down right")
    sprite_index = s_santa_down;
    image_xscale = 1;
  }

  if (direction >= down && direction < left) {
    show_debug_message("down left")
    sprite_index = s_santa_down;
    image_xscale = -1;
  }

  break;

case santa.attacking:
  break;

}