/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y,o_player)){
	if (name_ == "present1"){ 
		instance_deactivate_object(cutscene_checkondamien);
		setState(gamestates.boxesGone); 
		//replace boxpile
		with cutscene_boxpile{
			instance_change(cutscene_boxpile1gone,true)
		}
	}
	
}

