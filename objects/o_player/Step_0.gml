
//movement
var left = keyboard_check_direct(vk_left)
var right = keyboard_check_direct(vk_right)
var up = keyboard_check_direct(vk_up)
var down = keyboard_check_direct(vk_down)

// Get player position and speed
var player_x = x; // Replace with your actual player x-coordinate
var player_y = y; // Replace with your actual player y-coordinate
var hspd = 0 // Replace with your actual horizontal speed variable
var vspd = 0; // Replace with your actual vertical speed variable


if (left){
	hspd -= spd;
	image_xscale = 1;
	sprite_index = s_chara_girl_left;
}

if (right){
	hspd += spd;
	image_xscale = -1;
	sprite_index = s_chara_girl_left;
}

if (up){
	vspd -= spd;
	sprite_index = s_chara_girl_up;
}

if (down){
	vspd  += spd;
	sprite_index = s_chara_girl_down;
}


if keyboard_check_released(vk_left) || keyboard_check_released(vk_right)
|| keyboard_check_pressed(vk_up) || keyboard_check_released(vk_down){
	sprite_index = s_chara_girl_idle;
}
//collisions
var cam_id = view_camera[0];

// Get player position
var player_x = x; 
var player_y = y;

// Function to check tile collisions
function check_tile_collision(x, y) {
    var t_ = layer_tilemap_get_id("walls");
	//TODO find a way to do multiple tilesets 
    var tiles = tilemap_get_at_pixel(t_, x, y);

    return tiles; 
	}

// Check for tile collisions at the player's potential next position
var collision_at_next_position = check_tile_collision(player_x + hspd, player_y + vspd);

// check if by tilemap or interactable ( boxes etc.)
if (collision_at_next_position) {
    // There is a collision at the next position, handle it accordingly
    // For example, stop the player's movement or perform another action
    hspd = 0;
    vspd = 0;
	
} else {
    // Move the player if there is no collision
    x += hspd;
    y += vspd;
}


// keep in room?
clamp(x,0,room_width);
clamp(y,0,room_height);

//dialogue system
var interact = instance_place(x,y,o_interactable)

if (interact){
	var objectName = ""
for (var i = 0; i < array_length(global.interactables); i++){
	if (global.interactables[i].name_ == interact.name_ && keyboard_check_pressed(vk_space)){
		var object = global.interactables[i]
		
		o_ctrl.myText = object.myText;
		show_debug_message("object "+string(object.myText))
		
		
		//for (var j = 0; j < array_length(myText[curText]); j++){
		//	curText ++
		//}
			
		o_ctrl.nearItem = true
	}
	}
}
else{
	o_ctrl.nearItem = false;
}
