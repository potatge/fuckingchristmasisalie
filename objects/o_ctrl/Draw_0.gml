
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);
var view_w = view_x + camera_get_view_width(view_camera[0]);
var view_h = view_y + camera_get_view_height(view_camera[0]);
var alpha = 0.3;
var color = c_black

draw_set_alpha(alpha);
draw_set_color(color);

draw_rectangle(view_x, view_y, view_w, view_h, false);

