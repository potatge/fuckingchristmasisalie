

var touchplayer = instance_place(x, y, o_player)

if (touchplayer){
		   	o_ctrl.showText = true;	
}

if (global.state = gamestates.lightsOut){
	var area = collision_rectangle(x,y,x + 100,y + 100, cutscene_boxpile2, false, false);
	var boxes = instance_place(x,y, o_item_box);
	instance_destroy(boxes);
	if (alarm[0] <= 0){
		alarm[0] = 10;
	}
	show_debug_message("destroy boxes")
	
	//instance_destroy();
	
}