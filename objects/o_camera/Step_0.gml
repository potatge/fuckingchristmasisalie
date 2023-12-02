var cam_id, current_x, current_y;

// Assuming you're using view 0
cam_id = view_camera[0];

// Get current camera position
current_x = camera_get_view_x(cam_id);
current_y = camera_get_view_y(cam_id);

var snapdist = camera_get_view_height(view_camera[0]) *4 //700;
var smoothing = 0.2; // Adjust this value to control the smoothness of the transition

// Initialize target position
var target_y = current_y;

// Move camera down by snapdist units when player is below the view
if (o_player.bbox_bottom > current_y + camera_get_view_height(view_camera[0])){
    target_y = o_player.bbox_bottom - camera_get_view_height(view_camera[0]) + snapdist;
}

// Move camera up by snapdist units when player is above the view
if (o_player.bbox_top < current_y){
    target_y = o_player.bbox_top - snapdist;
}

// Smoothly interpolate towards the target position
current_y = lerp(current_y, target_y, smoothing);

// Set new camera position
camera_set_view_pos(cam_id, current_x, current_y);