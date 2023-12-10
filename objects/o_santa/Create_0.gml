instance_deactivate_object(o_santa);
//instance_activate_object(o_santa);
spd = 2.3;
randomize();
image_speed = 0;
enum santa {
	
	idle,
	awakened,
	pathstarted,
	onpath,
	stopandturn,
	attacking,
}

santaStates = santa.idle;
finishedPath = false;

enum path{
	
	notstarted,
	cellarstart,
	cellaronpath,
	cellarend,
	livingroomstart,
	livingroomonpath,
	livingroomturnaround,
	turnback,
	upanddownhallway
	
}

santaPath = path.notstarted

