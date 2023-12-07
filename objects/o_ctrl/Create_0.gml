global.drawDepth = -9000
global.charDepth = -5000;
global.cutscene = 0;
global.goodEnd = false;

global.curSpeakerLeft = noone
global.curSpeakerRight = noone
// for differentiating between normal play and options 
enum mode {
  playing,
  dialogue,
  options,
  optionsSelected,
  gameOver

}
global.gameMode = mode.playing;

maxOption = 1;
curOption = 0;

fridgeOpt = ["MILK n COOKIES", "WHITE WINE"]

decisionLVL = 0;
enum gamestates {

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
  lightsOut,
  santaThere,
  santaActivated,
  chaseBegins

};
global.state = gamestates.everythingsFine;
global.debugMode = false;
sfxPlay = false;
musicPlay = false;
//scr_changeSounds();
curSong = music_holidays;

depth = global.drawDepth
myText = "Xmas game gonna be fun."

showText = false;



//all interactables.

global.interactables = [

  {
    name_: "placeholder",
    myText: ["This is temporary boring dialogue...eck. What a waste of pixels.", "Vela really doesn't know how to code."],
    hasOption: false,
    portrait: noone,
	endAction: false
  },

  {
    name_: "moving boxes",
    myText: ["We haven't finished unpacking everything.", "It's not like I wanted to live in this dump, but...we needed to relocate for the job."],
    sprite: s_item_box,
    hasOption: false,
    portrait: noone,
	endAction: false
  },
  {
    name_: "sink",
    myText: ["Yuck. This stove needs a clean."],
    hasOption: false,
    portrait: noone,
	endAction: false

  },
   {
    name_: "bin",
    myText: ["Smelly."],
    hasOption: false,
    portrait: noone,
	endAction: false

  },
  {
    name_: "stewpot",
    myText: ["It's a beef stew in progress."],
    hasOption: false,
    portrait: noone,
	endAction: false
  },
  {
    name_: "xmas tree",
    canGrab: false,
    myText: ["It's a lovely tree, but I can't help but feel sad this time of year."],
    hasOption: false,
    portrait: noone,
	endAction: false

  },

  {
    name_: "city poster",
    myText: ["It's a poster from my favorite game."],
    sprite: s_bg_cityposter,
    portrait: noone,
    hasOption: false,
	endAction: false
  },

  {
    name_: "candycane poster",
    myText: ["It really gives the place some 'festive cheer'."],
    sprite: s_bg_cityposter,
    portrait: noone,
    hasOption: false,
	endAction: false
  },

  {
    name_: "bed",
    myText: ["It's way too early to sleep."],
    sprite: s_bg_bed,
    portrait: noone,
    hasOption: false,
	endAction: false
  },

  {
    name_: "table",
    myText: ["Looking a bit barren...", "Better cook something before the rellies get here."],
    sprite: s_bg_table,
    portrait: noone,
    hasOption: false,
	endAction: false
  },
  {
    name_: "chair",
    myText: ["I shouldn't rest right now. I have a lot to do."],
    sprite: s_bg_chair,
    portrait: noone,
    hasOption: false,
	endAction: false
  },

  {
    name_: "present1",
    myText: ["A present?", "It says 'For Claire' on the tag, but me and Damien said we'd only get each other one gift."],
    sprite: s_bg_table,
    portrait: noone,
    hasOption: false,
	endAction: present1EndAction,
  },

  {
    name_: "present2",
    myText: ["Another one?", "The tag reads...", "'You've been very naughty this year...'??", "W-Who did this? Creepy."],
    sprite: s_item_present3,
    portrait: noone,
    hasOption: false,
	endAction: present2EndAction,
  },

  {
    name_: "present for damien",
    myText: ["I should leave that there. It's for Damien."],
    sprite: s_item_present1,
    portrait: noone,
    hasOption: false,
	endAction: false
  },
  {
    name_: "present for claire",
    myText: ["This one is for me~ I can't wait. "],
    sprite: s_item_present2,
    portrait: noone,
    hasOption: false,
	endAction: false
  },

  {
    name_: "moving boxes2",
    myText: ["These boxes must be multiplying."],
    sprite: s_item_box,
    portrait: noone,
    hasOption: false,
	endAction: false

  },
  {
    name_: "blood",
    myText: ["This can't be happening...", "Oh...where are you?!"],
    sprite: s_sfx_blood,
    portrait: noone,
    hasOption: false,
	endAction: false
  },
  {
    name_: "cutscene_checkondamien",
    myText: ["Huh, weren't we about to have dinner?"],
    sprite: noone,
    portrait: noone,
    hasOption: false,
	endAction: false
  },
  {
    name_: "cutscene_boxpile2_gone",
    myText: ["Huh, there we're boxes here before."],
    sprite: noone,
    portrait: noone,
    hasOption: false,
	endAction: false
  }, 
  {

    name_: "cutscene_boxpile",
    myText: ["...did I put all these boxes here?"],
    sprite: noone,
    portrait: noone,
    hasOption: false,
	endAction: false

  },
  {

    name_: "cutscene_boxesgone",
    myText: ["Wait, weren't there boxes here before?"],
    sprite: noone,
    portrait: noone,
    hasOption: false,
	endAction: false

  },
  {
    name_: "cutscene_lightsout",
    myText: ["W-what the...!", "...I better use my phone's light!"],
    sprite: noone,
    portrait: noone,
    hasOption: false,
	endAction: false
  },
  {
    name_: "cutscene_santareveal",
    myText: ["---!!"],
    sprite: noone,
    portrait: noone,
    hasOption: false,
	endAction: false
  },
  {
    name_: "wine bottle",
    myText: ["Hey, it's the holidays."],
    sprite: noone,
    portrait: noone,
    hasOption: false,
	endAction: false
  },
  {
    name_: "wine empty",
    myText: ["Someone's a boozer."],
    sprite: noone,
    portrait: noone,
    hasOption: false,
	endAction: false
  },
  {
    name_: "wine empty",
    myText: ["Time for a refil?"],
    sprite: noone,
    portrait: noone,
    hasOption: false
  },
  {
    name_: "fireplace",
    hasOption: false,
    myText: ["Yes, we're even doing the stockings thing. What age are we, 6?"],
    sprite: noone,
    portrait: noone,
	endAction: false
  },
  {
    name_: "nightstand",
    hasOption: false,
    myText: ["It's where I put my keys."],
    sprite: s_bg_nightstand,
    portrait: noone,
	endAction: false
  },
  {
    name_: "fridge",
    myText: ["What should I get from the fridge?"],
    endText: ["An unassuming plate of milk and cookies? Can't help to be superstitious.","More wine!"],
    sprite: s_bg_nightstand,
    portrait: noone,
    hasOption: true,
	endAction: fridgeEndAction,
  },
  {
    name_: "kitchenarea",
    myText: ["I was trying to make a vegetarian curry, note the 'trying' part."],
    sprite: s_bg_kitchenarea,
    portrait: noone,
    hasOption: false,
	endAction: false
  },
  {
    name_: "knife",
    myText: ["Pointy."],
    sprite: s_bg_knife,
    portrait: noone,
    hasOption: false,
	endAction: false
  },
  
	{
    name_: "damien",
    canGrab: false,
    myText: ["I'll go and get another bottle."],
    sprite: s_chara_damien_collapsed,
    isSpeaker: true,
    hasOption: false,
	endAction: true,
    portrait: s_char_portraits_damien_happy,
	endAction: false
  },
  {
    name_: "damien2",
    canGrab: false,
    //TODO maybe trigger him yellow in distance.
    myText: [
      "Urgh...Claire, is that you. ",
      "W-what happened? Are you ok? Why are you on the floor of the bathr-",
      "Jingle bells...jingle bells...",
      "You aren't making any sense! Damien, snap out of it!",
      "He appeared out of nowhere with this...and he...",
      "Who did?",
      "*Damien collapses weakly to the floor again*",
      "I think you've had enough to drink. Stay right there!"
    ],
    sprite: s_chara_damien_collapsed,
    isSpeaker: true,
    hasOption: false,
    portrait: s_char_portraits_damien_worried,
	endAction: false
  },
	 
	 {
    name_: "damien3",
    canGrab: false,
    myText: [
      "H-help...",
      "C'mon, stand up! We gotta get out of here."
    ],
    sprite: s_chara_damien_collapsed,
    isSpeaker: true,
    hasOption: false,
	endAction: true,
    portrait: s_char_portraits_damien_worried,
	endAction: true
  },
  {
    name_: "damien4",
    canGrab: false,
    //TODO maybe trigger him yellow in distance.
    myText: ["*He appears too shaken to say anything*"],
    sprite: s_chara_damien_collapsed,
    isSpeaker: true,
    hasOption: false,
    portrait: s_char_portraits_damien_worried,
	endAction: false
  }


]
curText = 0;
moreTextAvailible = true;
lightsOut = false;

portraitArt = noone;
portraitDraw = false;