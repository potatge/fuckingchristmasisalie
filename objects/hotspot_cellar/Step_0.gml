var touch = instance_place(x,y,o_player)

if (touch && !transported){
	switch (room){
		case rm1:
			playerGoToRoom(rm_cellar,491,48)
			transported = true;
			
			break;
	
		case rm_cellar:
			playerGoToRoom(rm1,422,760)
			transported = true;
			break;
	}
} else {
	transported = false;
}




