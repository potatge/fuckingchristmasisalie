/// @description Insert description here
// You can write your code in this editor
if (instance_exists(layer_instance_get_instance("present3"))){
var box =  collision_rectangle(self.x,self.y,100,100,o_item_box,false,false)

if(box){
	//change to instance
	instance_destroy(o_item_box)
	
}

}