var touchplayer = instance_place(x, y, o_player)

if (touchplayer){
	o_ctrl.myText = myText
	o_ctrl.showText = true;
	o_ctrl.moreTextAvailible = true;
	show_debug_message("cut text?");
	//if (alarm[0] <= 0){
	//			alarm[0] = 10;
	//		}
}else{
	show_debug_message("no cut")
}
	
