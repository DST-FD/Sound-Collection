name = "  Webber-ah Sound Collection"
description = "v5.5.0"
author = "Webber-ah"
version = "5.5.0"

forumthread = ""
api_version = 10
icon_atlas = "modicon.xml"
icon = "modicon.tex"

priority = -9999
server_filter_tags = {""}

forumthread = ""

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
all_clients_require_mod = false
client_only_mod = true


local function Title(title, hover)
    return {
        name = title,
        hover = hover,
        options = {{description = "", data = 0}},
        default = 0,
    }
end

configuration_options =
{
	Title("󰀃 Non-Boss Monster 󰀃", ""),

	{
		name = "creature_mob_1",
		label = "Tallbird",
        hover = "Change Tallbirds to be more....   dramatic Leggybirds? Including: taunt/attack/hurt/sleep/wake",
		options =	{{description = "Off", data = false, hover = ""},
					 {description = "Only Legs", data = 2, hover = "This will only change its legs into Leggybird"},
					 {description = "Only Sound", data = 3, hover = "This will only change its sounds"},
					 {description = "On", data = 4},},
		default = 4,
	},
	{
		name = "creature_mob_2",
		label = "Hound",
        hover = "Change most of Hound sounds including bark, run, and death. This one also changes the Hound Warning sound to be somewhat more noticeable.",
		options =	{{description = "Off", data = false},
					 {description = "Only Warning", data = 2, hover = "This will only change the warning sound, but not the hound itself."},
					 {description = "On", data = 3},},
		default = 3,
	},
	{
		name = "creature_mob_3",
		label = "Splumonkey",
        hover = "Change some of Splumonkey sounds including taunt and throw. Nightmare version will only have the taunt sound.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "creature_mob_4",
		label = "Clockwork Knight",
        hover = "Change the taunt sound of it.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "creature_mob_5",
		label = "Gem Deer",
        hover = "An extra sound will play when Klaus' Gem Deers cast its spell to intimidate you more.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "creature_mob_6",
		label = "Koalefant",
        hover = "Change some of Koalefant sounds to always question your intention of finding them.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "creature_mob_7",
		label = "Werepig",
        hover = "Change the howl sound of it to something... uncanny...",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "creature_mob_8",
		label = "Frog",
        hover = "Change some of Frog sounds to perhaps... cuter?",
		options =	{{description = "Off", data = false},
					 {description = "Yoshi", data = 2, hover = "Including attack and death sound."},
					 {description = "Tadpole", data = 3, hover = "This will only change its attack sound into Bee Swarm Simulator Frog's sound."},},
		default = 2,
	},
	{
		name = "creature_mob_9",
		label = "Ghost",
        hover = "Make ghost more spooky and haunting with this sound.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "creature_mob_10",
		label = "Ewecus",
        hover = "He is a mad gamer. Real mad.",
		options =	{{description = "Off", data = false},
					 {description = "On (!)", data = 2, hover = "Be caution that its sound can be extreme and full of swearing."},},
		default = false,
	},
	{
		name = "creature_mob_11",
		label = "Mactusk",
        hover = "Change the group sound to match their hunting instinct.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "creature_mob_12",
		label = "Depth Worm",
        hover = "Change bite sound to someone as an iconic idol. This one also changes the Worm Warning sound to be somewhat more noticeable.",
		options =	{{description = "Off", data = false},
					 {description = "Only Warning", data = 2, hover = "This will only change the warning sound, but not the worm itself."},
					 {description = "On", data = 3},},
		default = 3,
	},

	Title("󰀅 Boss Monster 󰀅", ""),

	{
		name = "creature_boss_1",
		label = "Treeguard",
        hover = "I am Groot.",
		options =	{{description = "Off", data = false},
					 {description = "Only On Spawn", data = 2, hover = "In case you experience any lag or issues with Treeguard, try this."},
					 {description = "On", data = 3, hover = "I am Groot (Taunt and Death)"},},
		default = 3,
	},
	{
		name = "creature_boss_2",
		label = "Deerclops",
        hover = "Change Deerclops into a motorbike racer and a wizard. Including: taunt/attack/death/warning, ice_lance/stun/mutated_death",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "creature_boss_3",
		label = "Bearger",
        hover = "Change most of Bearger sounds to someone legendary. Including: eat/hurt/taunt/attack/death/ and also the warning. Along with yawn/wake for his sleep and two extra for his mutated transformation/butt attack.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "creature_boss_4",
		label = "Moose/Goose",
        hover = "Change its honking sound to match Leggybird.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "creature_boss_5",
		label = "Bee Queen",
        hover = "Change some of her sounds to make you regret of smashing her hive. Including: spawn/taunt/attack",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},
					 {description = "On With Music", data = 3, hover = "This option also changes the music to match her original meme source."},},
		default = 3,
	},
	{
		name = "creature_boss_6",
		label = "Ancient Fuelweaver",
        hover = "Change most of his sounds to make you know you are dealing with a very powerful being. Including: spawn/attack/cast/summon/shield/mindcontrol/death",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},

	Title("", ""),
	Title("󰀌 Misc / Stuffs 󰀌", ""),

	{
		name = "sound_stuffs_1",
		label = "Armor/Tool Break",
        hover = "Change the armor breaking sound to be much more intense, along with the tool breaking sound but less intense.",
		options =	{{description = "Off", data = false},
					 {description = "On (Player)", data = 2, hover = "Consider using this if you experience crashing."},
					 {description = "On (SFX)", data = 3, hover = "Default value"},},
		default = 3,
	},
	{
		name = "sound_stuffs_2",
		label = "Wardrobe",
        hover = "Tell everyone to look at you whenever you finish using the wardrobe.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "sound_stuffs_3",
		label = "Character Spawn",
        hover = "Notify you whenever someone join or enter your screen.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "sound_stuffs_4",
		label = "Boat Sinking",
        hover = "Add a dramatic song whenever the boat wreck.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "sound_stuffs_5",
		label = "Blowdart Shooting",
        hover = "Change the sound of blowdarts including the one from mactusk.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},

	Title("󰀏 Game / HUD 󰀏", ""),

	{
		name = "sound_game_1",
		label = "Gift Opening",
        hover = "Change the gift opening sound that you feel related to.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "sound_game_2",
		label = "Skeleton Inspecting",
        hover = "Add a sound whenever you inspect/examine a player skeleton.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},

	Title("󰀎 Player 󰀎", ""),

	{
		name = "sound_player_1",
		label = "Eat",
        hover = "Change eating sound into Minecraft eating sound.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "sound_player_2",
		label = "Death",
        hover = "Add one of the death sound from Roblox, Minecraft and Terraria.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "sound_player_3",
		label = "Collect",
        hover = "Change all collecting sounds to Minecraft collecting sound.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "sound_player_4",
		label = "Disgusting Food",
        hover = "Add a sound when the character refuse to eat something. Consider using different approaches if you experience lag, or turning this Off if lag still happen.",
		options =	{{description = "Off", data = false},
					 {description = "On (Timer)", data = 2, hover = "Using periodic task approach to check for animation, should work on every player."},
					 {description = "On (Items)", data = 3, hover = "Using player controller approach to check used items, only work on yourself and vanilla characters."},
					 {description = "On (Animation)", data = 4, hover = "Using player controller approach to check animation, only work on yourself."},},
		default = 4,
	},

	Title("󰀐 NPCs 󰀐", ""),

	{
		name = "sound_npc_1",
		label = "Wormhole",
        hover = "Add one certain meme to Wormhole sound. (Actually idk what to say lol)",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "sound_npc_2",
		label = "Darkness",
        hover = "Change darkness sounds to be more fearful and obviously louder.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "sound_npc_3",
		label = "Pig King",
        hover = "Add a rare quote for Pig King when you trade with him.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "sound_npc_4",
		label = "Poison Birchnut Tree",
        hover = "Change the tree screaming sound to scream at you for deforestation.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "sound_npc_5",
		label = "Suspicious Dirtpile",
        hover = "Add a sound whenever someone investigate a Suspicious Dirtpile.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "sound_npc_6",
		label = "Antlion Warning",
        hover = "Add antlion sound cue whenever he is attacking you with sinkholes or cavein.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},

	Title("", ""),
	Title("󰀌 Characters 󰀌", ""),

	{
		name = "character_wolfgang",
		label = "Wolfgang",
        hover = "Add Belune_BM's voice to some of Wolfgang sounds. Including: dumbel impact/crit work/gym success/mighty/wimpy/death",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "character_wigfrid",
		label = "Wigfrid",
        hover = "Add FreedomYok's voice to some of Wigfrid sounds. Including all of her battle songs and death sound.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
	{
		name = "character_wanda",
		label = "Wanda",
        hover = "Add Xemandeen's voice to some of Wanda sounds. Possible Including: rift portal/second chance/heal/old/young/death  (Subjected to change)",
		options =	{{description = "Off", data = false},
					 {description = "W.I.P.", data = 2},},
		default = 2,
	},
	{
		name = "character_wendy",
		label = "Wendy",
        hover = "Add Rosiiemarie's voice to some of Wendy sounds. Including: death,summon,recall,levelup,sisturn and all of her ghastly elixir.",
		options =	{{description = "Off", data = false},
					 {description = "On", data = 2},},
		default = 2,
	},
}