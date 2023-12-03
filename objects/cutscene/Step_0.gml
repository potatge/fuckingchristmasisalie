var area = collision_rectangle(x, y, 100, 100, o_player, false, false);
var boxes = instance_place(x, y, o_item_box);

//boxes removed after recieving present, so now you can go get black present.
show_debug_message("globalcutscene:" + string(global.cutscene))
var touchplayer = instance_place(x, y, o_player)

//if cutsceneHappening{
switch (global.cutscene) {
case 1:

  if (name_ == "cutscene1") {
    instance_destroy(boxes);
    cutsceneHappening = true;
  }

  if (touchplayer) {
    o_ctrl.showText = true;
    global.playerCanMove = false;
    if (alarm[0] <= 0) {
      alarm[0] = 50;
    }
  }
  break;

case 2:
  if (name_ == "cutscene2") {
    if object_exists(o_chara_damien) {
      with(o_chara_damien)
      instance_change(o_sfx_blood, false)
      cutsceneHappening = true;
    }

    if (touchplayer) {
      o_ctrl.showText = true;
      global.playerCanMove = false;
      if (alarm[0] <= 0) {
        alarm[0] = 50;
      }
    }
    break;
  }
}

//}