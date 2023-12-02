
//if you got rid of present. remove boxes.
var box =  collision_rectangle(self.x,self.y,100,100,o_item_box,false,false);
if (box){
	
	instance_destroy(box);
	
}