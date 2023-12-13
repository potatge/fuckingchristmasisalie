
//boxes removed after recieving present, so now you can go get black present.
var touchplayer = instance_place(x, y, o_player);

if (touchplayer){
		   	o_ctrl.showText = true;	
			//global.playerCanMove = false;
			//freeze for awhile and do action
			if (alarm[0] <= 0){
				show_debug_message("show text for awhile?")
				alarm[0] = 100;
			}
	  }
	  