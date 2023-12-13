depth = -9000//global.charDepth;
spd = 3;
global.playerCanMove = true;

enum player{
	alive,
	dead,
	dead2
}


playerState = player.alive;

global.playerXcoord = x;
global.playerYcoord = y;
vspd = 0;
hspd = 0;
// for left, top, right, bottom.
facing  = 0;


enum mood{
	happy,
	worried,
	determined
	
}

claireMood = mood.happy;