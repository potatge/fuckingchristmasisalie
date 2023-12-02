
var cam = view_camera[0];

var width = 300;
var height = 64;
var pad = 3;
var sep = 11;
// Get current camera position
var xx = camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - width /2 ;
var yy = camera_get_view_y(cam) + camera_get_view_height(cam) / 2 + height;
var c_ = c_white;


if (nearItem){
	draw_sprite_stretched_ext(s_textbox_black,0,xx,yy,width,height,c_,0.7);
	draw_set_font(fnt1);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text_ext(xx+pad,yy+pad,myText,sep,width-pad);
	draw_set_alpha(1);
}
