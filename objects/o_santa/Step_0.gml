//SANTA STATES
switch (santaStates) {

case santa.idle:
  x = 97;
  y = 1026;
  sprite_index = s_santa_up;
  if (global.state == gamestates.santaActivated) {
    santaStates = santa.awakened;
  }
  break;

case santa.awakened:
  //play anim
  show_debug_message("play anim. freeze chara! & alarm for 100")
  image_xscale = -1;
  sprite_index = s_santa_left_idle;

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
  path_speed = spd;
  //path_endaction = path_action_reverse;
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

  var pad = 5
  var meetplayer = collision_rectangle(bbox_left - pad, bbox_top - pad, bbox_right + pad, bbox_bottom + pad, o_player, false, false)
  if (meetplayer && o_player.playerState != player.dead2) {
    santaStates = santa.attacking;
    path_speed = 0
    o_player.playerState = player.dead;
  }

  //randomly stops an turns 
  if (alarm[2] <= 0) {
    alarm[2] = irandom_range(150, 550)
  }

  break;

case santa.stopandturn:
  path_speed = 0;
  //path_endaction = path_action_reverse;
  sprite_index = s_santa_left_idle;
  if (alarm[1] <= 0) {
    alarm[1] = irandom_range(110, 350)
  }
  break;

case santa.attacking:
  sprite_index = s_santa_sackbash;
  if (alarm[1] <= 0) {
    show_debug_message("santa attacking alarm")
    alarm[1] = 200;
  }
  break;

}

//// SANTA PATH 
switch (santaPath) {

  case path.notstarted:
     break;


  case path.livingroomstart:
    path_start(p_santa2_livingroom, spd, path_action_reverse, true)
	path_position = 0;
    show_debug_message("now going for living room.")
    santaStates = santa.pathstarted;
	santaPath = path.livingroomonpath;
	break;

  case path.livingroomonpath:
  //at end of path
    if (path_position = 1) {
      var here = path_position;
      show_debug_message("reverse livingroom path")
      path_reverse(p_santa2_livingroom);
      path_start(p_santa2_livingroom, spd, path_action_reverse, 1);
      path_position = 1 - here;
      santaPath = path.livingroomturnaround;
    }
	break;
	
	case path.livingroomturnaround:
	
	if (path_position >= 1){
		  show_debug_message("restart up and down hallway")
	      path_start(p_santa1_hallway, spd, path_action_reverse, 1);
	      santaPath = path.upanddownhallway;
	}
	  break;

  case path.upanddownhallway:
	  if  (path_position >= 1){
		  var here = path_position
		  path_reverse(p_santa1_hallway)
		  path_start(p_santa1_hallway, spd, path_action_reverse, 1);
		  path_position = 1- here
		 
	  }
	 break;

  
  break;

 
  }
  
  show_debug_message(path_position)