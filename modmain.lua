_G = GLOBAL

local STRINGS = GLOBAL.STRINGS

Assets =
{
	Asset("SOUNDPACKAGE", "sound/memeSound_1.fev"),
    Asset("SOUND", "sound/memeSound_1.fsb"),
	Asset( "ANIM", "anim/leggybird.zip" ),
}


----------------------------------------------------------------------------------------------------------------------------------------------------
--   Creature Sounds
----------------------------------------------------------------------------------------------------------------------------------------------------

--   Mobs Including:
--     - Tallbird
--     - Hound
--     - Monkey
--     - Clockwork Knight
--     - Gem Deer
--     - Koalefant
--     - Werepig
--     - Frog
--     - Ghost
--     - Ewecus
--     - Mactusk
--   Boss Including:
--     - Treeguard
--     - Deerclops
--     - Bearger
--     - Moose
--     - Bee Queen
--     - Ancient Fuelweaver


----------------------------------------------------------------------------------------------------------------------------------------------------
--   Game Sounds
----------------------------------------------------------------------------------------------------------------------------------------------------

--   Stuffs Including:
--     - Armor/Tool Break
--     - Wardrobe
--     - Character Spawning
--     - Boat Sinking
--   Game Including: 
--     - Gift opening
--   Player Including: 
--     - Eat
--     - Death
--     - Collect Resources
--   NPC Including: 
--     - Wormhole
--     - Charlie
--     - PigKing
--     - Poison Birchnut


----------------------------------------------------------------------------------------------------------------------------------------------------
--   Character Sounds
----------------------------------------------------------------------------------------------------------------------------------------------------

--   Wolfgang
--   Wigfrid
--   Wanda
--   Wendy


----------------------------------------------------------------------------------------------------------------------------------------------------
--   Creature Sounds
----------------------------------------------------------------------------------------------------------------------------------------------------
local leggyBirdData = GetModConfigData("creature_mob_1")
if leggyBirdData == 2 or leggyBirdData == 4 then
	STRINGS.NAMES.TALLBIRD = "Leggybird"
	AddPrefabPostInit("tallbird", function(inst)
		inst.AnimState:SetBank("tallbird")
		inst.AnimState:SetBuild("leggybird")
		inst.AnimState:PlayAnimation("idle")
		inst.AnimState:Hide("beakfull")
	end)
end
if leggyBirdData == 3 or leggyBirdData == 4 then
	RemapSoundEvent( "dontstarve/creatures/tallbird/chirp", "memeSound_1/creature/tallbird/taunt" )
	RemapSoundEvent( "dontstarve/creatures/tallbird/attack", "memeSound_1/creature/tallbird/attack" )
	RemapSoundEvent( "dontstarve/creatures/tallbird/hurt", "memeSound_1/creature/tallbird/hurt" )
	RemapSoundEvent( "dontstarve/creatures/tallbird/sleep", "memeSound_1/creature/tallbird/sleep" )
	RemapSoundEvent( "dontstarve/creatures/tallbird/wakeup", "memeSound_1/creature/tallbird/wake" )
end

if GetModConfigData("creature_mob_2") == 2 then
	RemapSoundEvent( "dontstarve/creatures/hound/distant", "memeSound_1/creature/hound/distant" )
	RemapSoundEvent( "dontstarve/creatures/worm/distant", "memeSound_1/creature/hound/distant" )
	RemapSoundEvent( "dontstarve/creatures/hound/bark", "memeSound_1/creature/hound/bark" )
	RemapSoundEvent( "dontstarve/creatures/hound/death", "memeSound_1/creature/hound/die" )
	RemapSoundEvent( "dontstarve/creatures/hound/growl", "memeSound_1/creature/hound/growl" )
end

if GetModConfigData("creature_mob_3") == 2 then
	STRINGS.NAMES.MONKEY = "Derp"
	STRINGS.NAMES.MONKEYBARREL = "Derp House"
	RemapSoundEvent( "dontstarve/creatures/monkey/taunt", "memeSound_1/creature/monkey/taunt" )
	RemapSoundEvent( "dontstarve/creatures/monkey/throw", "memeSound_1/creature/monkey/throw" )
	RemapSoundEvent( "dontstarve/creatures/monkey_nightmare/taunt", "memeSound_1/creature/monkey/nightmare_taunt" )
end

if GetModConfigData("creature_mob_4") == 2 then
	RemapSoundEvent( "dontstarve/creatures/knight/pawground", "memeSound_1/creature/knight/taunt" )
	RemapSoundEvent( "dontstarve/creatures/knight_nightmare/pawground", "memeSound_1/creature/creatures/knight/taunt" )
end

if GetModConfigData("creature_mob_5") == 2 then
	AddPrefabPostInit("deer_fire_charge", function(inst)
		inst.SoundEmitter:PlaySound("memeSound_1/creature/deer/cast")
	end)
	AddPrefabPostInit("deer_ice_charge", function(inst)
		inst.SoundEmitter:PlaySound("memeSound_1/creature/deer/cast")
	end)
end

if GetModConfigData("creature_mob_6") == 2 then
	RemapSoundEvent( "dontstarve/creatures/koalefant/alert", "memeSound_1/creature/koalefant/taunt" )
	RemapSoundEvent( "dontstarve/creatures/koalefant/angry", "memeSound_1/creature/koalefant/attack" )
end

if GetModConfigData("creature_mob_7") == 2 then
	RemapSoundEvent( "dontstarve/creatures/werepig/howl", "memeSound_1/creature/werepig/howl" )
end

if GetModConfigData("creature_mob_8") == 2 then
	RemapSoundEvent( "dontstarve/frog/attack_spit", "memeSound_1/creature/frog/attack_spit" )
	RemapSoundEvent( "dontstarve/frog/attack_voice", "memeSound_1/creature/frog/attack_voice" )
	RemapSoundEvent( "dontstarve/frog/die", "memeSound_1/creature/frog/die" )
elseif GetModConfigData("creature_mob_8") == 3 then
	RemapSoundEvent( "dontstarve/frog/attack_spit", "memeSound_1/creature/frog/attack_spit_bee" )
end

if GetModConfigData("creature_mob_9") == 2 then
	RemapSoundEvent( "dontstarve/ghost/ghost_howl_LP", "memeSound_1/creature/ghost/howl_LP" )
end

if GetModConfigData("creature_mob_10") == 2 then
	RemapSoundEvent( "dontstarve/creatures/spat/angry", "memeSound_1/creature/spat/attack" )
	RemapSoundEvent( "dontstarve/creatures/spat/spit", "memeSound_1/creature/spat/spit" )
	RemapSoundEvent( "dontstarve/creatures/spat/spit_hit", "memeSound_1/creature/spat/spit_hit" )
end

-- if GetModConfigData("creature_mob_11") == 2 then
-- end
----------------------------------------------------------------------------------------------------------------------------------------------------
function onleifdeath(inst)
	print("fuck you")
	-- only apply when host has the mod
    inst.SoundEmitter:PlaySound("memeSound_1/creature/groot/die")
end

if GetModConfigData("creature_boss_1") == 2 then
	STRINGS.NAMES.LEIF = "Groot"
	RemapSoundEvent( "dontstarve/creatures/leif/transform_VO", "memeSound_1/creature/groot/taunt" )
	AddPrefabPostInit("leif", function(inst)
		inst:ListenForEvent("death", onleifdeath)
	end)
	AddPrefabPostInit("leif_sparse", function(inst)
		inst:ListenForEvent("death", onleifdeath)
	end)
end

if GetModConfigData("creature_boss_2") == 2 then
	STRINGS.NAMES.DEERCLOPS = "Motorboi"
	RemapSoundEvent( "dontstarve/creatures/deerclops/distant", "memeSound_1/creature/deerclops/distant" )
	RemapSoundEvent( "dontstarve/creatures/deerclops/taunt_howl", "memeSound_1/creature/deerclops/taunt" )
	RemapSoundEvent( "dontstarve/creatures/deerclops/attack", "memeSound_1/creature/deerclops/attack" )
	RemapSoundEvent( "dontstarve/creatures/deerclops/death", "memeSound_1/creature/deerclops/die_brake" )
	RemapSoundEvent( "dontstarve/creatures/deerclops/bodyfall_dirt", "memeSound_1/creature/deerclops/die_crash" )
	RemapSoundEvent( "dontstarve/creatures/deerclops/bodyfall_snow", "memeSound_1/creature/deerclops/die_crash" )
end

if GetModConfigData("creature_boss_3") == 2 then
	RemapSoundEvent( "dontstarve_DLC001/creatures/bearger/distant", "memeSound_1/creature/bearger/distant" )
	RemapSoundEvent( "dontstarve_DLC001/creatures/bearger/taunt", "memeSound_1/creature/bearger/taunt" )
	RemapSoundEvent( "dontstarve_DLC001/creatures/bearger/attack", "memeSound_1/creature/bearger/attack" )
	RemapSoundEvent( "dontstarve_DLC001/creatures/bearger/death", "memeSound_1/creature/bearger/die" )
	RemapSoundEvent( "dontstarve_DLC001/creatures/bearger/gulp", "memeSound_1/creature/bearger/gulp" )
	RemapSoundEvent( "rifts3/mutated_bearger/taunt", "memeSound_1/creature/bearger/mutated_taunt" )
	RemapSoundEvent( "rifts3/mutated_bearger/buttslam", "memeSound_1/creature/bearger/mutated_buttslam" )
	RemapSoundEvent( "dontstarve_DLC001/creatures/bearger/taunt_short", "memeSound_1/creature/bearger/taunt_short" )
	RemapSoundEvent( "dontstarve_DLC001/creatures/bearger/yawn", "memeSound_1/creature/bearger/yawn" )
	RemapSoundEvent( "dontstarve_DLC001/creatures/bearger/hurt", "memeSound_1/creature/bearger/hurt" )
end

if GetModConfigData("creature_boss_4") == 2 then
	RemapSoundEvent( "dontstarve_DLC001/creatures/moose/honk", "memeSound_1/creature/moose/honk" )
end

if GetModConfigData("creature_boss_5") >= 2 then
	STRINGS.NAMES.BEEQUEEN = "E Mai Suay"
	RemapSoundEvent( "dontstarve/creatures/together/bee_queen/enter", "memeSound_1/creature/beequeen/enter" )
	RemapSoundEvent( "dontstarve/creatures/together/bee_queen/taunt", "memeSound_1/creature/beequeen/taunt" )
	RemapSoundEvent( "dontstarve/creatures/together/bee_queen/attack", "memeSound_1/creature/beequeen/attack" )
end
if GetModConfigData("creature_boss_5") == 3 then
	RemapSoundEvent( "dontstarve/music/music_epicfight_4", "memeSound_1/creature/beequeen/music_epicfight_beequeen" )
end

if GetModConfigData("creature_boss_6") >= 2 then
	RemapSoundEvent( "dontstarve/creatures/together/stalker/enter", "memeSound_1/creature/stalker/enter" )
	RemapSoundEvent( "dontstarve/creatures/together/stalker/attack1_pbaoe_pre", "memeSound_1/creature/stalker/attack_pre" )
	RemapSoundEvent( "dontstarve/creatures/together/stalker/attack_swipe", "memeSound_1/creature/stalker/attack_swipe" )
	RemapSoundEvent( "dontstarve/creatures/together/stalker/summon", "memeSound_1/creature/stalker/summon" )
	RemapSoundEvent( "dontstarve/creatures/together/stalker/shield", "memeSound_1/creature/stalker/shield" )
	RemapSoundEvent( "dontstarve/creatures/together/stalker/death3/transform", "memeSound_1/creature/stalker/transform" )
	RemapSoundEvent( "dontstarve/creatures/together/stalker/mindcontrol_LP", "memeSound_1/creature/stalker/mindcontrol" )
end

----------------------------------------------------------------------------------------------------------------------------------------------------
--   Game Sounds
----------------------------------------------------------------------------------------------------------------------------------------------------
if GetModConfigData("sound_stuffs_1") == 2 then
	RemapSoundEvent( "dontstarve/wilson/use_armour_break", "memeSound_1/sound/stuffs/use_armor_break" )
	RemapSoundEvent( "dontstarve/wilson/use_break", "memeSound_1/sound/stuffs/use_tools_break" )
end

if GetModConfigData("sound_stuffs_2") == 2 then
	RemapSoundEvent( "dontstarve/common/wardrobe_active", "memeSound_1/sound/stuffs/wardrobe_active")
end

-- Check if there is anything to do with TheWorld:PushEvent("ms_newplayerspawned", inst) | also consider adding "spawn_fx_small_high" or "spawn_fx_small"
if GetModConfigData("sound_stuffs_3") == 2 then
	RemapSoundEvent( "dontstarve/common/spawn/spawnportal_spawnplayer", "memeSound_1/sound/stuffs/characterspawn")

	AddPrefabPostInit("world", function(inst)
		inst:ListenForEvent("playerentered", function(inst, data)
			if data == nil then return end
			data.SoundEmitter:PlaySound("memeSound_1/sound/stuffs/characterspawn")
		end)
	end)
end

if GetModConfigData("sound_stuffs_4") == 2 then
	AddPrefabPostInit("fx_boat_pop", function(inst)
		GLOBAL.TheFocalPoint.SoundEmitter:PlaySound("memeSound_1/sound/stuffs/boat_break")
	end)
end
----------------------------------------------------------------------------------------------------------------------------------------------------
if GetModConfigData("sound_game_1") == 2 then
	RemapSoundEvent( "dontstarve/HUD/Together_HUD/player_receives_gift_animation", "memeSound_1/sound/game/gift_open")
end
----------------------------------------------------------------------------------------------------------------------------------------------------
if GetModConfigData("sound_player_1") == 2 then
	RemapSoundEvent( "dontstarve/wilson/eat", "memeSound_1/sound/player/eat" )
end

-- Don't forget to fix this sound
if GetModConfigData("sound_player_2") == 2 then
	RemapSoundEvent( "dontstarve/wilson/death", "memeSound_1/sound/player/death" )
end

-- ["wood"] = "aqol/new_test/wood",
-- ["gem"] = "aqol/new_test/gem",
-- ["cloth"] = "aqol/new_test/cloth",
-- ["metal"] = "aqol/new_test/metal",
-- ["rock"] = "aqol/new_test/rock",
-- ["vegetation_firm"] = "aqol/new_test/vegetation_firm",
-- ["vegetation_grassy"] = "aqol/new_test/vegetation_grassy",    
-- ["squidgy"] = "aqol/new_test/squidgy",
-- ["grainy"] = "aqol/new_test/grainy",
-- ["DEFAULT_FALLBACK"] = "dontstarve/HUD/collect_resource",
if GetModConfigData("sound_player_3") == 2 then
	RemapSoundEvent( "dontstarve/HUD/collect_resource", "memeSound_1/sound/player/collect_resource" )
	--Auto-update code by CarlZalph: https://steamcommunity.com/id/CarlZalph
	AddPrefabPostInit("world", function(inst)
		inst:ListenForEvent("playerentered", function(inst, data)
			if data == nil or data ~= GLOBAL.ThePlayer or data._PICKUPSOUNDS == nil then
				return
			end
			local replacewith = data._PICKUPSOUNDS["DEFAULT_FALLBACK"]
			for k, _ in pairs(data._PICKUPSOUNDS) do
				data._PICKUPSOUNDS[k] = replacewith
			end
		end)
	end)
end
----------------------------------------------------------------------------------------------------------------------------------------------------
if GetModConfigData("sound_npc_1") == 2 then
	STRINGS.NAMES.WORMHOLE = "Ohm"
	RemapSoundEvent( "dontstarve/common/teleportworm/open", "memeSound_1/sound/npc/teleportworm_enter" )
	RemapSoundEvent( "dontstarve/common/teleportworm/travel", "memeSound_1/sound/npc/teleportworm_travel" )
	RemapSoundEvent( "dontstarve/common/teleportworm/swallow", "memeSound_1/base/silence" )
end

if GetModConfigData("sound_npc_2") == 2 then
	RemapSoundEvent( "dontstarve/charlie/warn", "memeSound_1/sound/npc/charlie_warn" )
	RemapSoundEvent( "dontstarve/charlie/attack", "memeSound_1/sound/npc/charlie_attack" )
end

if GetModConfigData("sound_npc_3") == 2 then
	RemapSoundEvent( "dontstarve/pig/PigKingThrowGold", "memeSound_1/sound/npc/pigking_gold")
end

if GetModConfigData("sound_npc_4") == 2 then
	RemapSoundEvent( "dontstarve_DLC001/creatures/deciduous/angry", "memeSound_1/sound/npc/deciduous_gnash" )
end
----------------------------------------------------------------------------------------------------------------------------------------------------
--   Character Sounds
----------------------------------------------------------------------------------------------------------------------------------------------------
if GetModConfigData("character_wolfgang") == 2 then
	RemapSoundEvent( "wolfgang2/characters/wolfgang/wimpy", "memeSound_1/character/wolfgang/wimpy" )
	RemapSoundEvent( "wolfgang2/characters/wolfgang/mighty", "memeSound_1/character/wolfgang/mighty" )
	RemapSoundEvent( "wolfgang1/dumbbell/stone_impact", "memeSound_1/character/wolfgang/dumbel" )
	RemapSoundEvent( "wolfgang1/dumbbell/gold_impact", "memeSound_1/character/wolfgang/dumbel" )
	RemapSoundEvent( "wolfgang1/dumbbell/gem_impact", "memeSound_1/character/wolfgang/dumbel" )
	RemapSoundEvent( "meta2/wolfgang/critical_work", "memeSound_1/character/wolfgang/critwork" )
	RemapSoundEvent( "dontstarve/characters/wolfgang/death_voice", "memeSound_1/character/wolfgang/death_voice" )
end

if GetModConfigData("character_wigfrid") == 2 then
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/song/durability", "memeSound_1/character/wigfrid/song_weapon" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/song/fireresistance", "memeSound_1/character/wigfrid/song_fire" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/song/sanitygain", "memeSound_1/character/wigfrid/song_sanity" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/song/sanityaura", "memeSound_1/character/wigfrid/song_sanityaura" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/song/healthgain", "memeSound_1/character/wigfrid/song_health" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/quote/taunt", "memeSound_1/character/wigfrid/quote_taunt" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/quote/dropattack", "memeSound_1/character/wigfrid/quote_scare" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/death_voice", "memeSound_1/character/wigfrid/death_voice" )
end
