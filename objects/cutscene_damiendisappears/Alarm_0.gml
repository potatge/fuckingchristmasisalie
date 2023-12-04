if (global.state == gamestates.everythingsFine){
	global.state = gamestates.damienDisappears;
	//scr_stingerSound()
	instance_destroy();
}