if (global.state == gamestates.damienDisappears){
	scr_stingerSound();
	setState(gamestates.firstPresent);
	var present1 = instance_create_layer(64, 454, "Instances", o_item_present)
    with(present1) {
    name_ = "present1";
  }
	//only play once lmfao
}

