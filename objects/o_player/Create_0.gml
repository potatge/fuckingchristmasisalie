depth = global.charDepth;
spd = 3;
global.playerCanMove = true;
resetOnSpace = false;
inCutscene = false;


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

Facing = facing.down;
enum facing {
	
	up,
	left,
	down,
	right
	
}
