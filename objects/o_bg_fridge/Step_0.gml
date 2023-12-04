if (instance_place(x,y,o_player)){
	
	if  (global.state == gamestates.everythingsFine){
		global.state = gamestates.goToFridge;
		
		}

	if keyboard_check_pressed(ord("M")){
			//o_ctrl.myText = textIfCookies;
		 show_debug_message(myTextExtra)
		 myTextExtra = ["It can't hurt to follow tradition."]
		 global.goodEnd = true; 
			 
		 }
		 if keyboard_check_pressed(ord("W")){
			//.myText = textIfWine;
			global.goodEnd = false;
			show_debug_message(myTextExtra)
			myTextExtra = ["Eh, it's the holidays."]
		 }
}
	
else {
	sprite_index = s_bg_fridge_closed;
}

