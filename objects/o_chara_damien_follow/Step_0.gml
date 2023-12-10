switch (damienFollowStates){
	
case states2.follow:
	//not a collide-able anymore. can follow.
		move_towards_point(o_player.x-sign(8), o_player.y-sign(8),3);
	// add colision code.
	break;

	case states2.dead:
	sprite_index = s_chara_damien_collapsed;
	break;


}



