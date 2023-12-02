//get fullscreen
if keyboard_check_pressed(ord("F"))
{
    if window_get_fullscreen()
    {
        window_set_fullscreen(false);
    }
    else
    {
        window_set_fullscreen(true);
    }
}


switch (room){
	
	case rm_title:
		if keyboard_check_pressed(vk_space){
			room_goto(rm1)
		}
	break;
	
	case rm1:
	// do nothing
	break;
	
	
}