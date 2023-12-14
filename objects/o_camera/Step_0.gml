var cam_id, current_x, current_y;

bottom = o_player.bbox_bottom;
top = o_player.bbox_top;
left = o_player.bbox_left;
right = o_player.bbox_right;

// Assuming you're using view 0
cam_id = view_camera[0];

// Get current camera position
current_x = camera_get_view_x(cam_id);
current_y = camera_get_view_y(cam_id);

var snapdist_ver = camera_get_view_height(view_camera[0]) * 4; // Adjust the multiplier as needed
var snapdist_hor = camera_get_view_width(view_camera[0]) * 4; // Adjust the multiplier as needed
var smoothing = 0.2; // Adjust this value to control the smoothness of the transition

// Initialize target position
var target_y = current_y;
var target_x = current_x;

// Move camera down by snapdist units when player is below the view
if (o_player.bbox_bottom > current_y + camera_get_view_height(view_camera[0])) {
  target_y = o_player.bbox_bottom - camera_get_view_height(view_camera[0]) + snapdist_ver;
}

// Move camera up by snapdist units when player is above the view
if (o_player.bbox_top < current_y) {
  target_y = o_player.bbox_top - snapdist_ver;
}
// Move camera right by snapdist units when player is to the right of the view
if (o_player.bbox_right > current_x + camera_get_view_width(view_camera[0])) {
  target_x = o_player.bbox_right - camera_get_view_width(view_camera[0]) + snapdist_hor;
}

// Move camera left by snapdist units when player is to the left of the view
if (o_player.bbox_left < current_x) {
  target_x = o_player.bbox_left - snapdist_hor;

}

// Smoothly interpolate towards the target position
current_y = lerp(current_y, target_y, smoothing);
current_x = lerp(current_x, target_x, smoothing);

// Set new camera position
camera_set_view_pos(cam_id, current_x, current_y);