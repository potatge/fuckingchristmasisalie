setState(gamestates.bloodSplodge);

 with(o_chara_damien) {
    instance_change(o_sfx_blood, true)

}
instance_create_layer(o_sfx_blood.x-32,o_sfx_blood.y,"Instances",o_item_letter)
instance_deactivate_object(cutscene_boxpile1gone);
//instance_deactivate_object(cutscene_boxpile);
scr_stingerSound();
instance_destroy();