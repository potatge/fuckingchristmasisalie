/// @description Insert description here
// You can write your code in this editor

var left = keyboard_check_direct(vk_left)
var right = keyboard_check_direct(vk_right)
var up = keyboard_check_direct(vk_up)
var down = keyboard_check_direct(vk_down)

if (left){
	x -= spd;
}

if (right){
	x += spd;
}

if (up){
	y -= spd;
}

if (down){
	y += spd;
}
