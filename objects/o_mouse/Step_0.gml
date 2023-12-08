/// @description Insert description here
// You can write your code in this editor
var pad = 150
var nearplayer = collision_rectangle(bbox_left - pad, bbox_top - pad, bbox_right + pad, bbox_bottom + pad,o_player,false,false)
	
if (nearplayer && !animPlayed){
		if (alarm[0] <= 0){
			alarm[0] = 50;
			animPlayed = true;
     	}
}


//if end of path, destroy.
if (path_position == 1){
	path_end();
	instance_destroy();
}



