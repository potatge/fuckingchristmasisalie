

var touchplayer = instance_place(x, y, o_player)

if (touchplayer){
		   	o_ctrl.showText = true;	
}

if (global.state = gamestates.boxesGone){
	var area = collision_rectangle(x,y,x + 100,y + 100, cutscene1_boxpile, false, false);
	var boxes = instance_place(x,y, o_item_box);
	instance_destroy(boxes);
	
}