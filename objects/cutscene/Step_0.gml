
var area = collision_rectangle(x, y,x + 100, y + 100, cutscene, false, false);
var boxes = instance_place(x, y, o_item_box);


//boxes removed after recieving present, so now you can go get black present.
show_debug_message("cutscene:" + string(global.cutscene))
var touchplayer = instance_place(x, y, o_player)

switch (global.cutscene) {
case 1:
  instance_destroy(boxes);
  //cutsceneHappening = true;

  if (area) {
	o_ctrl.showText = true;
  }
  break;

case 2:

  //replace Damien obj with puddle of blood.
  with(o_chara_damien) {
    instance_change(o_sfx_blood, true)
  }
  
  if (touchplayer){
	   	o_ctrl.showText = true;
  }
  break;

case 3:
  o_ctrl.lightsOut = true
  if (touchplayer) {
	  o_ctrl.showText = true;
	  
  
  }
  break;
}

//}