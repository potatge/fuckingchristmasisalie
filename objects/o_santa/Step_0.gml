
switch (santaStates){
	
	case santa.idle:
		sprite_index = s_santa_left;
		image_speed = 1;
		if (global.state == gamestates.santaActivated){
			santaStates = santa.awakened;
		}
		
	break;
	
	case santa.awakened:
		
		image_speed = 1;
		//flip to right
		sprite_index = s_santa_left 
		image_index = -1;
		if (alarm[0] <=0){
			alarm[0] = 100;
			show_debug_message("alarm for 100")
		}

		break;
	
	case santa.pathstarted:
		sprite_index = s_santa_up;
		image_index = 1;
		show_debug_message("path started")
		santaStates = santa.onpath;
		break;
		
	case santa.onpath:
		break;
	
	case santa.attacking:
		break;
	
	
}

var left = 0;
var right =180;
var up = 90;
var down = 270;

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
