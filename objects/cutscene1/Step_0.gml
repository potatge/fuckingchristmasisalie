//if you got rid of present. remove boxes. 
var area = collision_rectangle(x,y,100,100,o_player,false,false);
var boxes = instance_place(x,y,o_item_box);

if (scene1 && area){
	instance_destroy(boxes);
	//instance_destroy();
	
}