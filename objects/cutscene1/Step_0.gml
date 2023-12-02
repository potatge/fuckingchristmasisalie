/// @description Insert description here
// You can write your code in this editor
if (scene1){
var box =  collision_rectangle(self.x,self.y,100,100,o_item_box,false,false)

if(box){
	//change to instance
	instance_destroy(o_item_box)
	
}

}