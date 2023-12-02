global.ctrlDepth = -4000;
depth = global.ctrlDepth;
myText = "oochie woochie bah bah xmas game gonna be fun."


nearItem = false;


//cutscene 
cutscene1Text = [
"Urgh...Claire, is that you. ",
"W-what happened? Are you ok? Why are you on the gro-",
"Jingle bells...jingle bells.",
"You aren't making any sense! Damien, snap out of it!",
"He appeared out of nowhere with this...and he..."
]

global.interactables = [

{
	name_: "placeholder",
	canGrab: true,
	myText:"This is temporary boring dialogue...eck. What a waste of pixels."
	
	},
	
	{
	name_: "xmas tree",
	canGrab: false,
	myText: "It's a lovely tree, but I can't help but feel sad this time of year."
	
	},
	
	{
	name_: "present1",
	canGrab: true,
	myText:"Yoinks. One present for me.",
	sprite: s_item_present2
	
	},
	{
	name_: "present for damien",
	canGrab: false,
	myText:"I should leave that there. It's for Damien.",
	sprite: s_item_present1
		
	},
	{
		name_: "damien",
	canGrab: false,
	myText: cutscene1Text[2],
	sprite: s_chara_boy_collapsed
	}
		
	
	
	
]

