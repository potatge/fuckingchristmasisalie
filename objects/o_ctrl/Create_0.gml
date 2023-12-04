global.drawDepth = -9000
global.charDepth = -5000;
global.cutscene = 0;
enum gamestates{
	
	everythingsFine,
	goToFridge,
	checkOnDamien,
	firstPresent,
	damienDisappears,
	//boxesExist,
	boxesGone,
	talkToDamien,
	secondPresentAppears,
	bloodSplodge,
	lightsOut
	
};
global.state =  gamestates.everythingsFine;

sfxPlay = false;
musicPlay = true;
//scr_changeSounds();


depth = global.drawDepth
myText = "Xmas game gonna be fun."

showText = false;

o_chara_damien.myText = ["I'll go an get another bottle."];
o_chara_damien.maxText = 0;

//all interactables.

global.interactables = [

{
	name_: "placeholder",
	canGrab: true,
	myText:["This is temporary boring dialogue...eck. What a waste of pixels.", "Vela really doesn't know how to code."],
	maxText: 0,
	portrait: noone
	},
	
	{
	name_: "moving boxes",
	canGrab: false,
	myText: ["We haven't finished unpacking everything.","It's not like I wanted to live in this dump, but...we needed to relocate for the job."],
	sprite: s_item_box,
	maxText: 1,
	portrait: noone
	},
	{
	name_: "sink",
	canGrab: false,
	myText: ["Yuck. This stove needs a clean."],
	maxText: 0,
	portrait: noone
	
	},
	{
	name_: "stewpot",
	canGrab: false,
	myText: ["It's a beef stew in progress."],
	maxText: 0,
	portrait: noone
	},
	{
	name_: "xmas tree",
	canGrab: false,
	myText: ["It's a lovely tree, but I can't help but feel sad this time of year."],
	maxText: 0,
	portrait: noone
	
	},
	{
	name_: "damien",
	canGrab: false,
	myText: o_chara_damien.myText,
	maxText: o_chara_damien.maxText,
	sprite: s_chara_damien_collapsed,
	isSpeaker: true,
	portrait: s_char_portraits_damien_happy
	},
	{
	name_: "damien2",
	canGrab: false,
	myText: [
			"Urgh...Claire, is that you. ",
			"W-what happened? Are you ok? Why are you on the grou-",
			"Jingle bells...jingle bells...",
			"You aren't making any sense! Damien, snap out of it!",
			"He appeared out of nowhere with this...and he...",
			"Who did?",
			"*Damien collapses weakly to the floor again*",
			"Stay right there!"
		],
	maxText: 7,
	sprite: s_chara_damien_collapsed,
	isSpeaker: true,
	portrait: s_char_portraits_damien_worried
	},
	
	
	{

		name_: "claire",
		portrait: s_char_portraits_claire_happy,
		isSpeaker: true,
		
	},
	
	{
	name_: "city poster",
	canGrab: false,
	myText: ["It's a poster from my favorite game."],
	maxText: 0,
	sprite: s_bg_cityposter,
	portrait: noone
	},
	
	{
	name_: "candycane poster",
	canGrab: false,
	myText: ["It really give the place some 'festive cheer'."],
	maxText: 0,
	sprite: s_bg_cityposter,
	portrait: noone
	},
	
	{
	name_: "bed",
	canGrab: false,
	myText: ["It's way too early to sleep."],
	sprite: s_bg_bed,
	maxText: 0,
	portrait: noone
	},
	
	{
	name_: "table",
	canGrab: false,
	myText: ["Looking a bit barren...","Better cook something before the rellies get here."],
	sprite: s_bg_table,
	maxText: 1,
	portrait: noone
	},
	{
	name_: "chair",
	canGrab: false,
	myText: ["I shouldn't rest right now. I have a lot to do."],
	sprite: s_bg_chair,
	maxText: 0,
	portrait: noone
	},
	
	{
	name_: "present1",
	canGrab: true,
	myText: ["What the, a present?","It says 'For Claire' on the tag, but me and Damien said we'd only get each other one gift."],
	sprite: s_bg_table,
	maxText: 1,
	portrait: noone
	},
	
	
	{
	name_: "present2",
	canGrab: true,
	myText:["Another one?","The tag reads...","'You've been very naughty this year...'??","W-Who did this? Creepy."],
	sprite: s_item_present3,
	maxText: 3,
	portrait: noone
	},
	
	{
	name_: "present for damien",
	canGrab: false,
	myText: ["I should leave that there. It's for Damien."],
	sprite: s_item_present1,
	maxText: 0,
	portrait: noone
	},
	{
	name_: "present for claire",
	canGrab: false,
	myText: ["This one is for me~ I can't wait. "],
	sprite: s_item_present2,
	maxText: 0,
	portrait: noone
	},
	
	{
	name_: "moving boxes2",
	canGrab: false,
	myText:["These boxes must be multiplying."],
	sprite: s_item_box,
	maxText: 0	,
	portrait: noone
		
	},
	{
	name_: "blood",
	canGrab: false,
	myText:["This can't be happening...","Oh...where are you?!"],
	sprite: s_sfx_blood,
	maxText: 1,
	portrait: noone
	},
	{
	name_: "cutscene_checkondamien",
	canGrab: false,
	myText:["Huh, weren't we about to have dinner?"],
	sprite: noone,
	maxText: 0,
	portrait: noone
	},
	{
		
	name_: "cutscene_boxpile",
	canGrab: false,
	myText:["...did I put all these boxes here?"],
	sprite: noone,
	maxText: 0,
	portrait: noone

	},	
	{
		
	name_: "cutscene_boxesgone",
	canGrab: false,
	myText:["Wait, weren't there boxes here before?"],
	sprite: noone,
	maxText: 0,
	portrait: noone

	},	
	{
	name_: "cutscene_lightsout",
	canGrab: false,
	myText:["W-what the...!","...I better use my phone's light!"],
	sprite: noone,
	maxText: 1,
	portrait: noone
	},
	{
	name_: "wine bottle",
	canGrab: false,
	myText:["Hey, it's the holidays."],
	sprite: noone,
	maxText: 0,
	portrait: noone
	},
	{
	name_: "wine empty",
	canGrab: false,
	myText:["Someone's a boozer."],
	sprite: noone,
	maxText: 0,
	portrait: noone
	,
	},
	{
	name_: "wine empty",
	canGrab: false,
	myText:["Time for a refil?"],
	sprite: noone,
	maxText: 0,
	portrait: noone
	},
	{
	name_: "fireplace",
	canGrab: false,
	myText:["Yes, we're even doing the stockings thing. What age are we, 6?"],
	sprite: noone,
	maxText: 0,
	portrait: noone
	},
		{
	name_: "nightstand",
	canGrab: false,
	myText:["It's where I put my keys."],
	sprite: s_bg_nightstand,
	maxText: 0,
	portrait: noone
	},
	{
	name_: "fridge",
	canGrab: false,
	myText:["At least our fridge is full."],
	sprite: s_bg_nightstand,
	maxText: 0,
	portrait: noone
	}
]

switch (room){
	
	case rm_title:
	//nothing 
	break;
	case rm1:
	audio_play_sound(music_holidays, 1, true);
	break;
	
}


curText = 0;
moreTextAvailible = true;
lightsOut = false;


portraitArt = noone;
portraitDraw = false;
