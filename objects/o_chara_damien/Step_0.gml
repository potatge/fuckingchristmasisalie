//should only do this once.
if (global.state == gamestates.talkToDamien && instance_place(x,y,o_player) && !metDamien){
		if (alarm[0] <= 0){
			alarm[0] = 10;
			metDamien = true;
		}
}

switch (damienStates){
	
	case states.normal:
		sprite_index = s_char_damien_idle
		maxText = 0;
		myText = ["I'll go get a new bottle!"]
		break;
	
	case states.hidden:
		x = 1032;
		y = 1032;
		break;
	
	case states.hurt:
		sprite_index = s_chara_damien_collapsed;
		name_ = "damien2"
		x = 797;
		y = 537;
		break;
	
	case states.hidden2:
		sprite_index  = s_chara_damien_collapsed;
		name_ = "damien3"
		x = 73 ;
		y = 974;
		break;
	
	case states.followher:
		sprite_index = s_char_damien_idle;
		name_ = "damien4"
		x = o_player.x-32-3;
		y = o_player.y
		break;

}