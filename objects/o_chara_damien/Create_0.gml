name_ = "damien";
metDamien = false;


enum states{
	
	normal,
	hidden,
	hurt,
	hidden2,
	followher
	
}
	

damienStates = states.normal
/*
switch (damienStates){
	case states.normal:
		maxText = 0;
		myText = ["I'll go get a new bottle!"]
		break;
		
	case states.hurt:
		myText = [
			"Urgh...Claire, is that you. ",
			"W-what happened? Are you ok? Why are you on the grou-",
			"Jingle bells...jingle bells...",
			"You aren't making any sense! Damien, snap out of it!",
			"He appeared out of nowhere with this...and he...",
			"Who did?",
			"*Damien collapses weakly to the floor again*",
			"Stay right there!"
		]
		maxText = 7;
		break;
}

