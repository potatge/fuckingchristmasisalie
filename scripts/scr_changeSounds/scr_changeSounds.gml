// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function src_changeSounds() {

  if (musicPlay) {
    audio_play_sound(music_holidays, 1, true);
    musicPlay = false;
  }
  if (sfxPlay) {
    show_debug_message("sfx play")
    audio_pause_sound(music_holidays);
    audio_play_sound(snd_stinger01, 1, 0);
    if (!audio_is_playing(snd_stinger01)) {
      show_debug_message_ext("resume music");
      audio_resume_sound(music_holidays);
      musicPlay = true;
      o_ctrl.sfxPlay = false;

    }

  }