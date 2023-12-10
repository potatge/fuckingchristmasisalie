switch (damienFollowStates){
	
case states2.follow:
	
	if (o_player.x > bbox_right){
		sprite_index = s_char_damien_left_move;
		image_xscale = -1;
	}
	
	if (o_player.x < bbox_left){
		sprite_index = s_char_damien_left_move;
		image_xscale = 1;
	}
	
	if (o_player.y < bbox_top){
		sprite_index = s_char_damien_up_move
	}
	
	if (o_player.y > bbox_bottom){
		sprite_index = s_char_damien_idle;
	}
	
	var pad  = 16;
	var left = o_player.bbox_left - pad ;
	var top = o_player.bbox_top
	var right = o_player.bbox_right;
	var bottom = o_player.bbox_bottom
	var space = collision_rectangle(left,top,right,bottom,o_player,false,false)
	//if not meeting right on top of player...move towards her.
	if (!space){
		move_towards_point(o_player.x-sign(8), o_player.y-sign(8),2);
	}
	
	// add colision code.
	break;

	case states2.dead:
	sprite_index = s_chara_damien_collapsed;
	break;


}



