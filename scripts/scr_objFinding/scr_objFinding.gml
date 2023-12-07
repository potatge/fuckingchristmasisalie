function findInteractable(myX, myY,object) {

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
  
function resetTextToNone(){
	  with (o_ctrl){
	    showText = false;
	    moreTextAvailible = false;
	    curText = 0;
		portraitDraw = false;
	  }
  }