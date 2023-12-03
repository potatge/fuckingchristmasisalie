
var area = collision_rectangle(x,y,100,100,o_player,false,false);
var boxes = instance_place(x,y,o_item_box);

if (scene == 1){
	instance_destroy(boxes);
	cutsceneHappening = true;
	
}

var area2 = instance_place(x,y,o_player)

if (area2 && cutsceneHappening){
	o_ctrl.showText = true;
	global.playerCanMove = false;
	if (alarm[0]<= 0){
		alarm[0] = 50;
	}
}