
//boxes removed after recieving present, so now you can go get black present.
var touchplayer = instance_place(x, y, o_player)


if (touchplayer){
		   	o_ctrl.showText = true;	
			//global.playerCanMove = false;
			//freeze for awhile and do action
			if (alarm[0] <= 0){
				alarm[0] = 10;
			}
	  }
	  