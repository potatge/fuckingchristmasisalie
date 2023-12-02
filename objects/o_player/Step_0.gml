
//movement
var left = keyboard_check_direct(vk_left)
var right = keyboard_check_direct(vk_right)
var up = keyboard_check_direct(vk_up)
var down = keyboard_check_direct(vk_down)

if (left){
	x -= spd;
	image_xscale = 1;
}

if (right){
	x += spd;
	image_xscale = -1;
}

if (up){
	y -= spd;
}

if (down){
	y += spd;
}

//collisions
var t_ = layer_tilemap_get_id("walls")
var tiles = tilemap_get_at_pixel(t_,x,y)
//var meet_right = tilemap_get_at_pixel(t_,bbox_right+1,y)
//var meet_left = tilemap_get_at_pixel(t_,bbox_left-1,y)
//var meet_up = tilemap
if (tiles){
	show_debug_message("meet tiles")
}else{
	show_debug_message("NO tile meet")
}