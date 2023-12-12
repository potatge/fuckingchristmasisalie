image_alpha = alpha;

switch (transition){
	case trans.fadein:
	// fades in from nothing
		alpha += fade;
		show_debug_message("fade in")
		if (alpha >= 1){
			transition = trans.middleaction;
		}
		break;
	
	case trans.middleaction:
	
	// DO SOMETHING SMART HERE. PUT IN SCRIPT>
	//if it's start of game
	    if (room == rm_title){
			room_goto(rm1)
		}
		
		// or if it's end of game 
		if (global.state == gamestates.givenCarrot){
			instance_activate_object(cutscene_door3);
			setState(gamestates.allOverRedRover)
		}
	
	
		transition = trans.fadeout;
		break;
	
	case trans.fadeout:
	show_debug_message("fade out")
	//if maximum darkness, start fade out
		alpha -= fade;
		if (alpha <= 0){
		// destroy or so something?
		instance_destroy();
		}
		break;
}



