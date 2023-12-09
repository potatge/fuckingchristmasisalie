var touch = instance_place(x,y,o_player)
if (touch && !transported){
	switch (room){
		case rm1:
			room_goto(rm_cellar);
			o_player.x = x;
			o_player.y = y;
			transported = true;
			break;
	
		case rm_cellar:
			room_goto(rm1);
			o_player.x = x;
			o_player.y = y;
			transported = true;
			break;
	}
} else {
	transported = false;
}




