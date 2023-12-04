if (global.state == gamestates.bloodSplodge){
	global.state = gamestates.lightsOut;
	show_debug_message("destroy: lights out")
	scr_stingerSound()
}