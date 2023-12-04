global.state = gamestates.lightsOut;
o_ctrl.lightsOut = true;
scr_stingerSound();
show_debug_message("lights out");
instance_destroy();