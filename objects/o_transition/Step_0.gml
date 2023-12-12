//happens every step

image_alpha = alpha;

//if maximum darkness, start fade out





switch (transition){
	case trans.fadein:
		alpha += fade;
		if (alpha >= 1){
			transition = trans.middleaction;
		}
		break;
	
	case trans.middleaction:
		instance_activate_object(cutscene_door3);
		setState(gamestates.allOverRedRover)
		transition = trans.fadeout;
		break;
	
	case trans.fadeout:
		alpha -= fade;
		if (alpha <= 0){
		// destroy or so something?
		instance_destroy();
		}
		break;
	
}



