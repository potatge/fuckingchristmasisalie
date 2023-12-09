var touch = instance_place(x,y,o_player)

if (touch && !transported){
	switch (room){
		case rm1:
			goToRoom(rm_cellar,491,53)
			transported = true;
			break;
	
		case rm_cellar:
			goToRoom(rm1,422,756)
			transported = true;
			break;
	}
} else {
	transported = false;
}




