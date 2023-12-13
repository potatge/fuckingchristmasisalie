var cam = view_camera[0];
var width = 300;
var height = 64;
var pad = 3;
var sep = 11;
draw_set_font(fnt1);
draw_set_color(c_white);
var x1 = camera_get_view_x(cam)
var y1 = camera_get_view_y(cam)
var xx_ = x1 + camera_get_view_width(cam)
var yy_ = y1 + camera_get_view_height(cam)
var xx = x1 + camera_get_view_width(cam) / 2 - width / 2;
var yy = y1 + camera_get_view_height(cam) / 2 + height;
var c_ = c_white;

switch (global.gameMode) {

case mode.options:
  var txt = "CHOOSE:\n" + string(Opt[0]) + "\n" + string(Opt[1])
  var wdth = string_width(txt) + 20;
  //var option = 16;
  draw_sprite_stretched_ext(s_textbox_black, 0, xx, yy - 50, wdth + pad, 45, c_, 0.7);
  draw_set_alpha(1);
  draw_set_color(c_white)
  draw_text_ext(xx + pad, yy - 50 + pad, txt, sep, wdth - pad);
  for (var i = 0; i < maxOption; i++) {
    draw_sprite_ext(s_arrow_right, 0, xx + wdth - 8, yy - 30 + i + 12 * curOption, 1, 1, 1, c_white, 1)
  }
  break;

case mode.gameOver:
  var b = c_black
  draw_set_alpha(0.4);
  draw_rectangle_color(0, 0, xx_, yy_, b, b, b, b, false)
  draw_set_alpha(1);
  draw_text(xx, yy, "You can do better than this! Press space to try again.")
  break;

}

switch (room) {


case rm_title:
  draw_set_font(fnt2);
  draw_set_halign(fa_left);
  draw_sprite_stretched_ext(s_splashscreen_title, 0, 0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), c_, 1);
  var txt = "Arrows to move.\nEnter to Select.\nSpace to interact.\nF to fullscreen."
  draw_set_color(c_white)
  draw_text(xx_ - string_width(txt), yy_ - 80, txt)
  if (!global.audio){
	  var c = c_red;
	var snd = "TAB to turn ON sound!"
  }else{
	  var c = c_green;
	  var snd = "TAB to turn OFF sound!"
  }
 draw_text_color(xx_ - string_width(snd), yy_ - 100,snd,c,c,c,c,1)
  break;

case rm1:

  draw_set_font(fnt1)

  if (lightsOut) {

    var c = make_colour_rgb(56, 56, 71);
    draw_set_alpha(0.6);
    gpu_set_blendmode(bm_subtract);
    draw_rectangle_color(00, 00, xx_, yy_, c, c, c, c, false);
    gpu_set_blendmode(bm_add);
    draw_set_alpha(1);
    gpu_set_blendmode(bm_normal);

  }

  // if text is showing 
  if (showText) {
    draw_sprite_stretched_ext(s_textbox_black, 0, xx, yy, width, height, c_, 0.7);
    draw_set_alpha(1);
    draw_text_ext(xx + pad, yy + pad, myText, sep, width - pad);
    draw_set_alpha(1);

    if (moreTextAvailible) {
      draw_sprite(s_arrow_right, 0, xx + pad + width - 10, yy + pad + height - 10)
    }
  }

  if (portraitDraw) {
    cam = view_camera[0]
    var xx_ = camera_get_view_x(cam)
    var yy_ = camera_get_view_y(cam)
    var wdth = 100
    var hght = 150
    var xx = xx_ + camera_get_view_width(cam)
    var yy = yy_ + camera_get_view_height(cam)
    var por_right = instance_create_layer(xx - wdth, yy - hght, "portraits", o_char_portraits)
    var por_left = instance_create_layer(xx - width - wdth * 2, yy - hght, "portraits", o_char_portraits)
    por_right.sprite_index = global.curSpeakerRight;
    por_left.sprite_index = global.curSpeakerLeft;
  } else {
    if (object_exists(o_char_portraits)) {
      instance_destroy(o_char_portraits);
    }
  }
  break;
}


// global states. 
switch (global.state) {

	
case gamestates.allOverRedRover:
  draw_set_color(c_white);
  draw_set_font(fnt1);
  var width = camera_get_view_width(view_camera[0])
  var height = camera_get_view_height(view_camera[0])
  if (global.goodEnd) {
	draw_sprite_stretched(s_cutscene_goodend,0,x1, y1,width,height)
    draw_text(x1, y1, "You both make it to safety. Good End!")
  } else {
    draw_sprite_stretched(s_cutscene_badend, 0, x1, y1,width,height)
    draw_text(x1, y1, "Uh. Did you forget your injured partner on purpose? Bad End.")
  }
  draw_text(x1, y1 + 32, "Art, story and programming by Vela Noble.\n@velanoble velanoble.itch.io")
  draw_text(x1, y1 + 56, "Press space to play again.")
  break;
}