instance_deactivate_object(cutscene_lightsout);
if (global.state = gamestates.santaActivated){
	var area = collision_rectangle(x,y,x + 100,y + 100, cutscene_santareveal, false, false);
	var boxes = instance_place(x,y, o_item_box);
	instance_destroy(boxes);
	
}