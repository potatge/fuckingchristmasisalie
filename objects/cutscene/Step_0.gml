
var area = collision_rectangle(x, y, 100, 100, o_player, false, false);
var boxes = instance_place(x, y, o_item_box);


//boxes removed after recieving present, so now you can go get black present.
show_debug_message("cutscene:" + string(global.cutscene))
var touchplayer = instance_place(x, y, o_player)

switch (global.cutscene) {
case 1:

  var cutscenename = "cutscene1"
  o_ctrl.myText = "cutscene 1";
  instance_destroy(boxes);
  //cutsceneHappening = true;

  if (area) {
    o_ctrl.showText = true;
	o_ctrl.myText = "cutscene 2";
	show_debug_message("in area");
    //global.playerCanMove = false;
    //if (alarm[0] <= 0) {
    //  alarm[0] = 50;
    //}
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
	  o_ctrl.showText = true;
    o_ctrl.myText = "A blackout? I better use my phone's light."
    if (alarm[0] <= 0) {
      alarm[0] = 50;
    }
  }
  break;
}

//}