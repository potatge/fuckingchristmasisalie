// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_stingerSound() {
  o_ctrl.musicPlay = false;
    audio_pause_sound(music_holidays);
    audio_play_sound(snd_stinger01, 1, 0);

}