if (global.state = gamestates.keyObtained){
	// if you have damien, good end. oth
	if (!object_exists(o_chara_damien_follow)){
		setState(gamestates.endBad)
	}else{
		setState(gamestates.endGood);
	}
}