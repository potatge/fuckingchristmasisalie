var touch = instance_place(x,y,o_player){
if (touch && !cutsceneHappening){
	if alarm[0]<= 0{
		alarm[0] = 10;
		show_debug_message("setalarm for cutscene ")
	}	
	cutsceneHappening = true;
}
}