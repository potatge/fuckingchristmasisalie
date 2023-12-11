if (global.state = gamestates.keyObtained){
	// if you have damien, good end. oth
	if (!object_exists(o_chara_damien_follow)){
		global.goodEnd = false;
		setState(gamestates.endBad)
	}else{
		global.goodEnd = true;
		setState(gamestates.endGood);
		
	}
}