global.state = gamestates.bloodSplodge

 with(o_chara_damien) {
    instance_change(o_sfx_blood, true)

}
instance_deactivate_object(cutscene_boxpile1gone);
//instance_deactivate_object(cutscene_boxpile);
scr_stingerSound();
instance_destroy();