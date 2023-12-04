if (instance_place(x, y, o_player) && global.cutscene == 0) {
  global.state = gamestates.boxesGone;
    o_ctrl.musicPlay = false;
    show_debug_message("sfx play");
    audio_pause_sound(music_holidays);
    audio_play_sound(snd_stinger01, 1, 0);
    
}