var area = collision_rectangle(x, y, 100, 100, o_player, false, false);
var boxes = instance_place(x, y, o_item_box);


switch (scene){
	
	case 1:
	//boxes removed after recieving present, so now you can go get black present.
		 instance_destroy(boxes);
	  cutsceneHappening = true;

	  var area1 = instance_place(x, y, o_player)

	  if (area1 && cutsceneHappening) {
	    o_ctrl.showText = true;
	    global.playerCanMove = false;
	    if (alarm[0] <= 0) {
	      alarm[0] = 50;
	    }
	  }
	break;
	
	//damien replaced with blood pool.
	case 2:
	var area2 = instance_place(x,y,o_player);
	
	o_ctrl.showText = true;
	    global.playerCanMove = false;
	    if (alarm[0] <= 0) {
	      alarm[0] = 50;
	    }
	break;
}
