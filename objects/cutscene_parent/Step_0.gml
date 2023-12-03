var area = collision_rectangle(x, y,x + 100, y + 100, cutscene0_boxpile, false, false);
var boxes = instance_place(x, y, o_item_box);

//boxes removed after recieving present, so now you can go get black present.
show_debug_message("cutscene:" + string(global.cutscene))
var touchplayer = instance_place(x, y, o_player)


if (area){
		   	o_ctrl.showText = true;	
			global.playerCanMove = false;
			//freeze for awhile and do action
			if (alarm[0] <= 0){
				alarm[0] = 10;
			}
	  }
	  