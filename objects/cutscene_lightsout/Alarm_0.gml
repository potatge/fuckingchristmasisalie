global.state = gamestates.lightsOut;
o_ctrl.lightsOut = true;
scr_stingerSound();
show_debug_message("lights out");
instance_create_layer(o_player.x,o_player.y,"sfx",o_sfx_light)
instance_destroy();