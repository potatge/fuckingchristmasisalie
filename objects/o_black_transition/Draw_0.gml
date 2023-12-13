var xpos = camera_get_view_x(view_camera[0]);
var ypos = camera_get_view_x(view_camera[0]);
var width = camera_get_view_width(view_camera[0]);
var height = camera_get_view_height(view_camera[0]);


draw_sprite_stretched_ext(s_black,0,xpos,ypos,width,height,c_white,alpha);