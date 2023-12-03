
var area = collision_rectangle(x,y,100,100,o_player,false,false);
var boxes = instance_place(x,y,o_item_box);

if (scene1){
	instance_destroy(boxes);
	//instance_destroy();
	cutsceneHappening = true;
	
}

var area2 = instance_place(x,y,o_player)

if (area2 && cutsceneHappening){
	o_ctrl.showText = true;
	show_debug_message("within area. can't move.");
	//temporary stop player move
	global.playerCanMove = false;
	if (alarm[0]<= 0){
		alarm[0] = 60;
		show_debug_message(alarm[0]);
	}
}