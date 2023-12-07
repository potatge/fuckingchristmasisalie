switch (santaStates) {

case santa.idle:
  sprite_index = s_santa_up;
  if (global.state == gamestates.santaActivated) {
    santaStates = santa.awakened;
  }

  break;

case santa.awakened:
  //play anim
  show_debug_message("play anim & alarm for 100")
  sprite_index = s_santa_left_idle
  if (alarm[0] <= 0) {
   image_speed = 1;
    image_index = -1
    alarm[0] = 100;
    
  }
  break;

case santa.pathstarted:
  show_debug_message("path started")
  santaStates = santa.onpath;
  break;

case santa.onpath:
  var left = 0;
  var right = 180;
  var up = 90;
  var down = 270;

  if (direction >= left && direction < up) {
	  show_debug_message("up left")
	 image_xscale = -1;
    sprite_index = s_santa_left_move;
  }

  if (direction >= up && direction < 180){
	 show_debug_message("up right")
	 sprite_index = s_santa_up;
    image_xscale = 1;
  }
  
   if (direction >= right && direction < down){
	 show_debug_message("down right")
	 sprite_index = s_santa_down;
    image_xscale = 1;
  }
  
  if (direction >= down && direction < left){
	 show_debug_message("down left")
	 sprite_index = s_santa_down;
    image_xscale = -1;
  }
  
  
  break;

case santa.attacking:
  break;

}
// attempting to give direction sprites.

/*
if (direction < left  && direction >= down){
	show_debug_message("right")
	sprite_index = s_santa_left
	image_xscale = -1;
	
}

if *direction >left && direction < right){
	sprite_index = s_santa_left
	image_xscale = 1;
	
}
if (direction > right && direction <= down) {
sprite_index = s_santa_down;
	image_xscale = -1;
	
}

if (direction > left && direction <= up) {
sprite_index = s_santa_up
	image_xscale = -1;
	
}