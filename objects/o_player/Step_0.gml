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

//sprites
var up_idle = s_chara_girl_up_idle
var up_mov = s_chara_girl_up
var down_mov = s_chara_girl_down
var down_idle = s_chara_girl_down_idle
var left_ = s_chara_girl_left

switch (playerState) {

case player.alive:
    break;

case player.dead:
	sprite_index = s_chara_girl_faint;
	screenshake(30, 5, 0.2);
	playerState = player.dead2;
	break;
	
case player.dead2:
    sprite_index = s_chara_girl_faint;
	global.playerCanMove = false;
	break;
}

if (global.playerCanMove){
	//else, be alive and move.
	if (left) {
	  hspd -= spd;
	  facing = 1
	  image_xscale = 1;
	  sprite_index = left_
	}
	
	if (up) {
      facing = 2;
	  vspd -= spd;
	  sprite_index = up_mov
	}

	if (right) {
	  facing = 3;
	  hspd += spd;
	  image_xscale = -1;
	  sprite_index = left_
	}


	if (down) {
	 facing = 4
	 vspd += spd;
	  sprite_index = down_mov
	}

	// revert back to idle
	if (keyboard_check_released(vk_left) || keyboard_check_released(vk_right)) {
	  sprite_index = down_idle
	}

	if (keyboard_check_released(vk_down || keyboard_check_released(vk_up))) {
	  sprite_index = down_idle
	}

}else{
	if (playerState != player.dead2){
		sprite_index = s_chara_girl_thinking;
	}
}
// keep in room? not working best. 
clamp(x, 0, room_width);
clamp(y, 0, room_height);

//collisions all in this script.
	// Collisions
var cam_id = view_camera[0];

// Get player position
var player_x = x;
var player_y = y;

// Function to check tile collisions
function check_tile_collision(x, y) {
  var t_ = layer_tilemap_get_id("walls");
  var tiles = tilemap_get_at_pixel(t_, x, y);

  return tiles;
}

//collisions 
var collisions = instance_place(x, y, [o_interactable, o_chara])
//var characollisions = instance_place(x, y, o_chara)
// Check for tile collisions at the player's potential next position
var collision_at_next_position = check_tile_collision(player_x + hspd, player_y + vspd);

// Check if there's an obstacle (interactable) at the player's next position
var obstacle_at_next_position = instance_place(player_x + hspd, player_y + vspd, collisions);

// Check if there's an obstacle (interactable) at the player's next position
//var characollisions_at_next_position = instance_place(player_x + hspd, player_y + vspd, characollisions);

// Check if there's a collision with tilemap or interactable (boxes, etc.)
if (collision_at_next_position || obstacle_at_next_position) {
  // There is a collision at the next position, handle it accordingly
  // For example, stop the player's movement or perform another action
  hspd = 0;
  vspd = 0;

  // Handle interaction with the obstacle (e.g., stop movement, trigger some action)
} else {
  // Move the player if there is no collision
  x += hspd;
  y += vspd;
}


// mood portrait.

switch (claireMood){
	case mood.happy:
		clairePortrait  = s_char_portraits_claire_happy;
		break;
		
	case mood.worried:
		clairePortrait = s_char_portraits_claire_worried;
		break;
		
	case mood.determined:
		clairePortrait = s_char_portraits_claire_determined;
		break;
		
}

//cutscene 
var cut = instance_place(x, y, cutscene)

var item = findInteractable(x, y, [o_interactable, o_chara]);

if (item == noone && cut == noone) {
  resetTextToNone();
  return;
}

//dialogue system. needs to be at bottom rn.
if (keyboard_check_pressed(vk_space) && item != noone) {

var cur = o_ctrl.curText
var textall = array_length(item.myText)

  if (cur < textall) {
	  
    o_ctrl.showText = true;
	if (cur == textall - 1){
	o_ctrl.moreTextAvailible = false;
   }else{
	   o_ctrl.moreTextAvailible = true;
   }
    o_ctrl.myText = item.myText[o_ctrl.curText];
    o_ctrl.curText++

  //if no speaker, no portraits.
  if (!item.isSpeaker){
	  return;
  }else{
	o_ctrl.portraitDraw = true;
	global.curSpeakerLeft = clairePortrait;
    global.curSpeakerRight = item.portrait;
  }


  } else {
	  
    //if (item.hasOption) {
    //  global.gameMode = mode.options;
   // }

    if (item.endAction) {
		show_debug_message("end action?")
		item.endAction(item);
      //handle end action

    } else {
		resetTextToNone();
	}
  }
} // cutscene activated 

if (cut != noone && !cut.frozePlayerForCutscene && cut.freezePlayer){
	if (cut.alarm[1] <= 0){
		cut.alarm[1] = 100;
		global.playerCanMove = false;
		o_ctrl.myText = cut.myText;
		o_ctrl.showText = true;
		o_ctrl.moreTextAvailible = true;
	}
}
