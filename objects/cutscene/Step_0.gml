
var area = collision_rectangle(x, y, 45, 45, o_player, false, false);
var boxes = instance_place(x, y, o_item_box);


//boxes removed after recieving present, so now you can go get black present.
show_debug_message("cutscene:" + string(global.cutscene))
var touchplayer = instance_place(x, y, o_player)

switch (global.cutscene) {
case 1:

  var cutscenename = "cutscene1"
  instance_destroy(boxes);
  //cutsceneHappening = true;

  if (area) {
	show_debug_message("in area1");
  }
  break;

case 2:
  var cutscenename = "cutscene2"
  //replace Damien obj with puddle of blood.
  with(o_chara_damien) {
    instance_change(o_sfx_blood, true)
  }
  break;

case 3:

  o_ctrl.lightsOut = true
  
  if (touchplayer) {
	  show_debug_message("in area2")
  
  }
  break;
}

//}