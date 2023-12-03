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

//only move player if allowed.
if (global.playerCanMove) {

  if (left) {
    hspd -= spd;
    image_xscale = 1;
    sprite_index = s_chara_girl_left;
  }

  if (right) {
    hspd += spd;
    image_xscale = -1;
    sprite_index = s_chara_girl_left;
  }

  if (up) {
    vspd -= spd;
    sprite_index = s_chara_girl_up;
  }

  if (down) {
    vspd += spd;
    sprite_index = s_chara_girl_down;
  }

}
// revert back to idle
if (keyboard_check_released(vk_left) || keyboard_check_released(vk_right)) {
  sprite_index = s_chara_girl_idle;
}

if (keyboard_check_released(vk_down || keyboard_check_released(vk_up))) {
  sprite_index = s_chara_girl_idle;
}

// keep in room? not working best. 
clamp(x, 0, room_width);
clamp(y, 0, room_height);

//dialogue system
//dialogue system

var interact = instance_place(x, y, [o_interactable, cutscene])
if (interact) {
  var object = ""

  if (keyboard_check_pressed(vk_space)) {
    o_ctrl.moreTextAvailible = true;
    for (var i = 0; i < array_length(global.interactables); i++) {

      if (global.interactables[i].name_ == interact.name_) {
        var object = global.interactables[i];
        o_ctrl.myText = object.myText[o_ctrl.curText];

        //if at max text, key pres
        if ((o_ctrl.curText == object.maxText)) {
          o_ctrl.moreTextAvailible = false;
          o_ctrl.curText = 0;
          return;
        } else {
          o_ctrl.curText++
          //messing it up below
        }
        show_debug_message("object " + string(object.myText[o_ctrl.curText]))
      }
      o_ctrl.showText = true;
    }
  }
} else {
  //not near item, set current text back to zero.
  o_ctrl.showText = false;
  o_ctrl.curText = 0;
}

// Collisions
var cam_id = view_camera[0];

// Get player position
var player_x = x;
var player_y = y;

// Function to check tile collisions
function check_tile_collision(x, y) {
  var t_ = layer_tilemap_get_id("walls");
  // TODO: Find a way to handle multiple tilesets
  var tiles = tilemap_get_at_pixel(t_, x, y);

  return tiles;
}

//collisions 
var collisions = instance_place(x, y, o_interactable)
// Check for tile collisions at the player's potential next position
var collision_at_next_position = check_tile_collision(player_x + hspd, player_y + vspd);

// Check if there's an obstacle (interactable) at the player's next position
var obstacle_at_next_position = instance_place(player_x + hspd, player_y + vspd, collisions);

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