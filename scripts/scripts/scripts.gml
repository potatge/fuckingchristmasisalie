function findItem(name_) {
  for (var i = 0; i < array_length(global.interactables); i++) {
    if (global.interactables[i].name_ == name_) {
      return global.interactables[i];
    }
  }
  return noone
}

function findInteractable(myX, myY, object) {

  var interact = instance_place(myX, myY, object)
  if (interact) {
    for (var i = 0; i < array_length(global.interactables); i++) {
      if (global.interactables[i].name_ == interact.name_) {
        return global.interactables[i];
      }
    }
  }
  return noone;
}

function resetTextToNone() {
  with(o_ctrl) {
    showText = false;
    moreTextAvailible = false;
    curText = 0;
    portraitDraw = false;
  }
}


function fridgeEndAction() {
	show_debug_message("fridge endaction");
	
var fridge  = findItem("fridge");

  if (global.goodEnd) {
    o_ctrl.myText = fridge.endText[0];
  } else {
    o_ctrl.myText = fridge.endText[1];
  }

}

function present1EndAction() {
show_debug_message("present1 endaction");
	
var present  = findItem("present1");
instance_destroy();

}


function present2EndAction() {
show_debug_message("present2 endaction");
	
var present  = findItem("present2");
instance_destroy();

}

