global.ctrlDepth = -4000;
depth = global.ctrlDepth;
myText = "oochie woochie bah bah xmas game gonna be fun."


nearItem = false;


//cutscene 


global.interactables = [

{
	name_: "placeholder",
	canGrab: true,
	myText:["This is temporary boring dialogue...eck. What a waste of pixels.", "Vela really doesn't know how to code."],
	maxText: 0
	},
	
	{
	name_: "moving boxes",
	canGrab: false,
	myText: ["We haven't finished unpacking everything."],
	sprite: s_item_box,
	maxText: 0
	},
	
	{
	name_: "xmas tree",
	canGrab: false,
	myText: ["It's a lovely tree, but I can't help but feel sad this time of year."],
	maxText: 0
	
	},
	
	{
	name_: "present1",
	canGrab: true,
	myText:["Yoinks. One present for me."],
	sprite: s_item_present2,
	maxText: 0
	
	},
	{
	name_: "present for damien",
	canGrab: false,
	myText: ["I should leave that there. It's for Damien."],
	sprite: s_item_present1,
	maxText: 0
		
	},
	{
		name_: "damien",
	canGrab: false,
	myText: [
		"Urgh...Claire, is that you. ",
		"W-what happened? Are you ok? Why are you on the gro-",
		"Jingle bells...jingle bells.",
		"You aren't making any sense! Damien, snap out of it!",
		"He appeared out of nowhere with this...and he..."
	],
	maxText: 5,
	sprite: s_chara_boy_collapsed
	},
	{
	name_: "city poster",
	canGrab: false,
	myText:["It's a poster from my favorite game."],
	maxText: 0
	},
	
]

curText = 0;
