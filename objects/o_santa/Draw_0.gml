draw_set_alpha(0.5);
draw_sprite(s_santa_shadow,0,x,y+14)
draw_set_alpha(1)
draw_self()

if global.debugMode{
	var pad = 5;
	draw_set_color(c_green);
	draw_rectangle(bbox_left-pad,bbox_top-pad,bbox_right+pad,bbox_bottom+pad,true)
}



