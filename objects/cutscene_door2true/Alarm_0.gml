if (global.state = gamestates.keyObtained){
	// if you have damien, good end. oth
	if (global.goodEnd){
		setState(gamestates.endGood)
	}else{
		setState(gamestates.endBad)
	}
}