global.drawDepth = -9000
global.charDepth = -5000;
depth = global.drawDepth
myText = "oochie woochie bah bah xmas game gonna be fun."


showText = false;


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
	myText: ["We haven't finished unpacking everything.","It's not like I wanted to live in this dump, but...we needed to relocate for the job."],
	sprite: s_item_box,
	maxText: 1
	},
	
	{
	name_: "xmas tree",
	canGrab: false,
	myText: ["It's a lovely tree, but I can't help but feel sad this time of year."],
	maxText: 0
	
	},
	{
		name_: "damien",
	canGrab: false,
	myText: [
		"Urgh...Claire, is that you. ",
		"W-what happened? Are you ok? Why are you on the grou-",
		"Jingle bells...jingle bells...",
		"You aren't making any sense! Damien, snap out of it!",
		"He appeared out of nowhere with this...and he...",
		"Who did?",
		"*Damien collapses weakly to the floor again*"
	],
	maxText: 6,
	sprite: s_chara_boy_collapsed
	},
	
	{
	name_: "city poster",
	canGrab: false,
	myText: ["It's a poster from my favorite game."],
	maxText: 0,
	sprite: s_bg_cityposter
	},
	
	{
	name_: "bed",
	canGrab: false,
	myText: ["It's way too early to sleep."],
	sprite: s_bg_bed,
	maxText: 0
	},
	
	{
	name_: "table",
	canGrab: false,
	myText: ["Looking a bit barren...","Better cook something before the rellies get here."],
	sprite: s_bg_table,
	maxText: 1
	},
	
	{
	name_: "present2",
	canGrab: true,
	myText: ["What the, another present...?","It says 'For Claire' on the tag.","...but me and Damien said we'd only get each other one gift."],
	sprite: s_bg_table,
	maxText: 2,
	},
	
	
	{
	name_: "present3",
	canGrab: true,
	myText:["Another one?","The tag reads...'You've been very naughty this year...'??","W-Who did this? Creepy."],
	sprite: s_item_present3,
	maxText: 2
	},
	
	{
	name_: "present for damien",
	canGrab: false,
	myText: ["I should leave that there. It's for Damien."],
	sprite: s_item_present1,
	maxText: 0
	},
	
	{
	name_: "moving boxes2",
	canGrab: false,
	myText:["Yeahhh, we need to get through these boxes."],
	sprite: s_item_box,
	maxText: 0	
		
	},
	
	{
	name_: "cutscene",
	canGrab: false,
	myText:["Wait, weren't there a bunch of boxes here before??"],
	sprite: noone,
	maxText: 0
		
		
	}
	
]

curText = 0;
moreTextAvailible = true;