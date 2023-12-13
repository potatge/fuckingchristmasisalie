//should only do this once.
if (global.state == gamestates.talkToDamien && instance_place(x,y,o_player) && !metDamien){
		if (alarm[0] <= 0){
			alarm[0] = 10;
			metDamien = true;
		}
}

switch (damienStates){
	
	case states.normal:
			x = 160;
			y = 232;
			sprite_index = s_char_damien_idle;
			maxText = 0;
			myText = ["I'll go get a new bottle!"];
		break;
	
	case states.hidden:
		x = 1032;
		y = 1032;
		break;
	
	case states.hurt:
	     x = 789;
		 y = 545;
		sprite_index = s_chara_damien_collapsed;
		name_ = "damien2";
		break;
	
	case states.cellar:
		sprite_index  = s_chara_damien_collapsed;
		name_ = "damien3";
		x = 90;
		y = 1055;
		break;
	
	case states.followher:
		instance_change(o_chara_damien_follow,true);
		break;
		
		case states.dead:
		sprite_index = s_chara_damien_collapsed;

		break;
}