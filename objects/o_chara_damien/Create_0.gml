/// @description Insert description here
// You can write your code in this editor
name_ = "damien";
metDamien = false;


enum states{
	
	normal,
	hurt
	
}
	

damienStates = states.normal

switch (damienStates){
	case states.normal:
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
		break;
}

