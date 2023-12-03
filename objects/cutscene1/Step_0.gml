
var area = collision_rectangle(x,y,100,100,o_player,false,false);
var boxes = instance_place(x,y,o_item_box);

if (scene1){
	instance_destroy(boxes);
	//instance_destroy();
	cutsceneOver = true;
	
}


if (area && cutsceneOver){
	o_ctrl.showText = true;
	o_ctrl.myText = "Weren't there a bunch of boxes here before?"
	show_debug_message("within area")
	cutsceneOver = false;
	//global.playerCanMove = false;
	//alarm[0] = 60;
	
	
}