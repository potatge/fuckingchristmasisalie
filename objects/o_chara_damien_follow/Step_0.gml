switch (damienFollowStates){
	
case states2.follow:

	var spd = 3;
	var o = o_player;
	var tile = 32;
	
	
	if (o_player.x < bbox_left){
		sprite_index = s_char_damien_left_move;
		image_xscale = 1;
	}
	
	
	if (o_player.y < bbox_top){
		sprite_index = s_char_damien_up_move;
	}
	
	
	if (o.x > bbox_right){ // on the left 
		sprite_index = s_char_damien_left_move;
		image_xscale = -1;
	}
	
	
	if (o_player.y > bbox_bottom){
		sprite_index = s_char_damien_down_move;
		
	}
	
	
	if (x != o.x && y != o.y) {
	//if not meeting right on top of player...move towards her.
    if (distance_to_point(o.x, o.y) < 6) { 
		spd = 1;
	}
		move_towards_point(o.x -sign(4) , o.y - sign(4), spd);
	}
	
	

	// add collision code.
	// if player died, Damien dies. 
	if (o.playerState == player.dead2){
		damienFollowStates = states2.dead;
	}
	
	
	break;

	case states2.dead:
	sprite_index = s_chara_damien_collapsed;
	break;


}



