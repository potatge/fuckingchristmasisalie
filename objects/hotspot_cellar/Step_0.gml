var touch = instance_place(x,y,o_player)

if (room == rm1 && touch ){
	room_goto(rm_cellar);
}

if (room == rm_cellar && touch){
	room_goto(rm1);
}


