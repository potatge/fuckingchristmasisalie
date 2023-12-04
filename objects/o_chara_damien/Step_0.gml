if (global.state == gamestates.boxesGone){
	damienStates = states.hurt;
	if (instance_place(x,y,o_player)){
		if (alarm[0] <= 0){
			alarm[0] = 10;
		}
		
	}
}

switch (damienStates){
	
	case states.normal:
	sprite_index = s_char_damien_idle
	maxText = 0;
		myText = ["I'll go get a new bottle!"]
	break;
	
	case states.hurt:
	sprite_index = s_chara_damien_collapsed;
	name_ = "damien2"
	x = 797;
	y = 537;
	break;

}