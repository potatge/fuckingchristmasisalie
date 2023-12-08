setState(gamestates.lightsOut);
o_ctrl.lightsOut = true;
audio_stop_sound(music_holidays)
o_ctrl.curSong = music_suspense;

//???
frozePlayerForCutscene = true; 
global.playerCanMove = true;
instance_deactivate_object(self);

