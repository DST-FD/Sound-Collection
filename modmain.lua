Assets =
{
	Asset("SOUNDPACKAGE", "sound/memeSound_1.fev"),
	Asset("SOUND", "sound/memeSound_1.fsb"),
	Asset( "ANIM", "anim/leggybird.zip" ),
}


----------------------------------------------------------------------------------------------------------------------------------------------------
--   Initializes
----------------------------------------------------------------------------------------------------------------------------------------------------
local STRINGS = GLOBAL.STRINGS
local scheduler = GLOBAL.scheduler
local sound_delay = {}

-- Create condition_table for all the prefabs, it will remain true if the prefab is not found
local function GetNearbyPrefabsCondition(pos, radius, prefab_table, need_player)
	-- Initialize Condition table
	prefab_table = prefab_table or {}
	local condition_table = {}
	for _,prefab in pairs(prefab_table) do
		condition_table[prefab] = true
	end

	-- Check nearby
	local player
	local ents = GLOBAL.TheSim:FindEntities(pos.x,pos.y,pos.z, radius)
	for _,v in pairs(ents) do
		-- Get Player
		if need_player and v:HasTag("player") then
			player = v
		end

		-- Get Prefabs : Set false if found
		if condition_table[v] then
			condition_table[v] = false
		end
	end

	-- Check condition
	if need_player and not player then
		print("Missing Player")
		return false
	end

	for _,conditions in pairs(condition_table) do	-- If prefab is true then that prefab is missing
		if conditions then
			print("Missing Prefab: " .. conditions)
			return false
		end
	end

	print("Found All Prefabs")
	return true
end

local function PlaySoundSFX(fx, sound)
	if not fx.SoundEmitter then
		fx.entity:AddSoundEmitter()
	end
	fx.SoundEmitter:PlaySound(sound)
end

local function GetCurrentAnimation(inst)
	return string.match(inst.entity:GetDebugString(), "anim: ([^ ]+) ")
end
----------------------------------------------------------------------------------------------------------------------------------------------------
--   Creature Sounds
----------------------------------------------------------------------------------------------------------------------------------------------------

--   Mobs Including:
--     - Tallbird
--     - Hound
--     - Monkey +
--     - Clockwork Knight
--     - Gem Deer * 
--     - Koalefant *
--     - Werepig *
--     - Frog *
--     - Ghost *
--     - Ewecus *
--     - Mactusk *
--     - Depth Worm *
--   Boss Including:
--     - Treeguard +
--     - Deerclops +
--     - Bearger +
--     - Moose
--     - Bee Queen +
--     - Ancient Fuelweaver *


----------------------------------------------------------------------------------------------------------------------------------------------------
--   Game Sounds
----------------------------------------------------------------------------------------------------------------------------------------------------

--   Stuffs Including:
--     - Armor/Tool Break
--     - Wardrobe
--     - Character Spawning
--     - Boat Sinking
--     - Blowdart Shoot *
--   Game Including: 
--     - Gift opening
--     - Player Skeleton Inspecting *
--   Player Including: 
--     - Eat
--     - Death
--     - Collect Resources
--     - Refuse Eating *
--   NPC Including: 
--     - Wormhole
--     - Charlie
--     - PigKing
--     - Poison Birchnut *
--	   - Suspicious Dirtpile 
--	   - Antlion Warning


----------------------------------------------------------------------------------------------------------------------------------------------------
--   Character Sounds
----------------------------------------------------------------------------------------------------------------------------------------------------

--   Wolfgang *
--   Wigfrid *
--   Wanda
--   Wendy *


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

if GetModConfigData("creature_mob_2") then
	RemapSoundEvent( "dontstarve/creatures/hound/distant", "memeSound_1/creature/hound/distant" )
	if GetModConfigData("creature_mob_2") == 3 then
		RemapSoundEvent( "dontstarve/creatures/hound/bark", "memeSound_1/creature/hound/bark" )
		RemapSoundEvent( "dontstarve/creatures/hound/death", "memeSound_1/creature/hound/die" )
		RemapSoundEvent( "dontstarve/creatures/hound/growl", "memeSound_1/creature/hound/growl" )
	end
end

if GetModConfigData("creature_mob_3") then
	STRINGS.NAMES.MONKEY = "Derp"
	STRINGS.NAMES.MONKEYBARREL = "Derp House"
	RemapSoundEvent( "dontstarve/creatures/monkey/taunt", "memeSound_1/creature/monkey/taunt" )
	RemapSoundEvent( "dontstarve/creatures/monkey/throw", "memeSound_1/creature/monkey/throw" )
	RemapSoundEvent( "dontstarve/creatures/monkey_nightmare/taunt", "memeSound_1/creature/monkey/nightmare_taunt" )
end

if GetModConfigData("creature_mob_4") then
	RemapSoundEvent( "dontstarve/creatures/knight/pawground", "memeSound_1/creature/knight/taunt" )
	RemapSoundEvent( "dontstarve/creatures/knight_nightmare/pawground", "memeSound_1/creature/creatures/knight/taunt" )
end

if GetModConfigData("creature_mob_5") then
	AddPrefabPostInit("world", function(inst)
		local preload = false;
		inst:ListenForEvent("playerentered", function(inst, data)
			if preload and (data == nil or data ~= GLOBAL.ThePlayer) then
				return
			end
			local fx = GLOBAL.SpawnPrefab("deer_fire_charge")
            fx.entity:SetParent(inst.entity)
			fx:DoTaskInTime(.1 , fx:Remove())
			preload = true
		end)
	end)
	AddPrefabPostInit("deer_fire_charge", function(inst)
		inst.SoundEmitter:PlaySound("memeSound_1/creature/deer/cast")
	end)
	AddPrefabPostInit("deer_ice_charge", function(inst)
		inst.SoundEmitter:PlaySound("memeSound_1/creature/deer/cast")
	end)
end

if GetModConfigData("creature_mob_6") then
	RemapSoundEvent( "dontstarve/creatures/koalefant/alert", "memeSound_1/creature/koalefant/taunt" )
	RemapSoundEvent( "dontstarve/creatures/koalefant/angry", "memeSound_1/creature/koalefant/attack" )
end

if GetModConfigData("creature_mob_7") then
	RemapSoundEvent( "dontstarve/creatures/werepig/howl", "memeSound_1/creature/werepig/howl" )
end

if GetModConfigData("creature_mob_8") then
	if GetModConfigData("creature_mob_8") == 3 then
		RemapSoundEvent( "dontstarve/frog/attack_spit", "memeSound_1/creature/frog/attack_spit_bee" )
	else
		RemapSoundEvent( "dontstarve/frog/attack_spit", "memeSound_1/creature/frog/attack_spit" )
		RemapSoundEvent( "dontstarve/frog/attack_voice", "memeSound_1/creature/frog/attack_voice" )
		RemapSoundEvent( "dontstarve/frog/die", "memeSound_1/creature/frog/die" )
	end
end

if GetModConfigData("creature_mob_9") then
	RemapSoundEvent( "dontstarve/ghost/ghost_howl_LP", "memeSound_1/creature/ghost/howl_LP" )
end

if GetModConfigData("creature_mob_10") then
	RemapSoundEvent( "dontstarve/creatures/spat/angry", "memeSound_1/creature/spat/attack" )
	RemapSoundEvent( "dontstarve/creatures/spat/spit", "memeSound_1/creature/spat/spit" )
	RemapSoundEvent( "dontstarve/creatures/spat/spit_hit", "memeSound_1/creature/spat/spit_hit" )
end

if GetModConfigData("creature_mob_11") then
	STRINGS.NAMES.LITTLE_WALRUS = "Violet"
	STRINGS.NAMES.WALRUS = "Catherine"
	RemapSoundEvent( "dontstarve/creatures/wee_mctusk/taunt", "memeSound_1/creature/mactusk/little_taunt" )
	RemapSoundEvent( "dontstarve/creatures/mctusk/taunt", "memeSound_1/creature/mactusk/taunt" )
	RemapSoundEvent( "dontstarve/creatures/mctusk/attack", "memeSound_1/creature/mactusk/taunt" )
end

if GetModConfigData("creature_mob_12") then
	RemapSoundEvent( "dontstarve/creatures/worm/distant", "memeSound_1/creature/worm/distant" )
	if GetModConfigData("creature_mob_12") == 3 then
		STRINGS.NAMES.WORM = "Ajarn Daeng"
		RemapSoundEvent( "dontstarve/creatures/worm/bite", "memeSound_1/creature/worm/bite" )
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------
if GetModConfigData("creature_boss_1") then
	STRINGS.NAMES.LEIF = "Groot"
	RemapSoundEvent( "dontstarve/creatures/leif/transform_VO", "memeSound_1/creature/groot/taunt" )

	-- Add Death Sound
	if GetModConfigData("creature_boss_1") == 3 then
		AddPrefabPostInit("leif", function(inst)
			local anim = ""
			if inst._deathSoundTask ~= nil then return end

			inst._deathSoundTask = inst:DoPeriodicTask(0.2, function()
				anim = GetCurrentAnimation(inst)
				if anim == "death" then
					inst._deathSoundTask:Cancel()
					inst.SoundEmitter:PlaySound("memeSound_1/creature/groot/die")
				end
			end)
		end)
		AddPrefabPostInit("leif_sparse", function(inst)
			local anim = ""
			if inst._deathSoundTask ~= nil then return end

			inst._deathSoundTask = inst:DoPeriodicTask(0.2, function()
				anim = GetCurrentAnimation(inst)
				if anim == "death" then
					inst._deathSoundTask:Cancel()
					inst.SoundEmitter:PlaySound("memeSound_1/creature/groot/die")
				end
			end)
		end)
	end
end

if GetModConfigData("creature_boss_2") then
	STRINGS.NAMES.DEERCLOPS = "Motorboi"
	RemapSoundEvent( "dontstarve/creatures/deerclops/distant", "memeSound_1/creature/deerclops/distant" )
	RemapSoundEvent( "dontstarve/creatures/deerclops/taunt_howl", "memeSound_1/creature/deerclops/taunt" )
	RemapSoundEvent( "dontstarve/creatures/deerclops/attack", "memeSound_1/creature/deerclops/attack" )
	RemapSoundEvent( "dontstarve/creatures/deerclops/death", "memeSound_1/creature/deerclops/die_brake" )
	RemapSoundEvent( "dontstarve/creatures/deerclops/bodyfall_dirt", "memeSound_1/creature/deerclops/die_crash" )
	RemapSoundEvent( "dontstarve/creatures/deerclops/bodyfall_snow", "memeSound_1/creature/deerclops/die_crash" )

	STRINGS.NAMES.MUTATEDDEERCLOPS = "Jadeite"
	RemapSoundEvent( "rifts3/mutated_deerclops/taunt_grrr", "memeSound_1/creature/deerclops/mutated/taunt_grrr" )	-- idk if this is good
	RemapSoundEvent( "rifts3/mutated_deerclops/death", "memeSound_1/creature/deerclops/mutated/death" )
	RemapSoundEvent( "rifts3/mutated_deerclops/ice_throw_f13", "memeSound_1/creature/deerclops/mutated/ice_pre" )
	RemapSoundEvent( "rifts3/mutated_deerclops/ice_throw_f47", "memeSound_1/creature/deerclops/mutated/ice_pst" )
	RemapSoundEvent( "rifts3/mutated_deerclops/stunned_pre_break_f13", "memeSound_1/creature/deerclops/mutated/stunned_pre" )
	RemapSoundEvent( "rifts3/mutated_deerclops/stunned_pst_f0", "memeSound_1/creature/deerclops/mutated/stunned_pst" )
	RemapSoundEvent( "rifts3/mutated_deerclops/stunned_pst_f70", "memeSound_1/creature/deerclops/mutated/stunned_recover" )
end

if GetModConfigData("creature_boss_3") then
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

if GetModConfigData("creature_boss_4") then
	RemapSoundEvent( "dontstarve_DLC001/creatures/moose/honk", "memeSound_1/creature/moose/honk" )
end

if GetModConfigData("creature_boss_5") then
	STRINGS.NAMES.BEEQUEEN = "E Mai Suay"
	RemapSoundEvent( "dontstarve/creatures/together/bee_queen/enter", "memeSound_1/creature/beequeen/enter" )
	RemapSoundEvent( "dontstarve/creatures/together/bee_queen/taunt", "memeSound_1/creature/beequeen/taunt" )
	RemapSoundEvent( "dontstarve/creatures/together/bee_queen/attack", "memeSound_1/creature/beequeen/attack" )
	if GetModConfigData("creature_boss_5") == 3 then
		RemapSoundEvent( "dontstarve/music/music_epicfight_4", "memeSound_1/creature/beequeen/music_epicfight_beequeen" )
	end
end


if GetModConfigData("creature_boss_6") then
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
if GetModConfigData("sound_stuffs_1") then
	if GetModConfigData("sound_stuffs_1") == 3 then
		RemapSoundEvent( "dontstarve/wilson/use_armour_break", "memeSound_1/sound/stuffs/use_armor_break" )
		RemapSoundEvent( "dontstarve/wilson/use_break", "memeSound_1/sound/stuffs/use_tools_break" )
	else
		RemapSoundEvent( "dontstarve/wilson/use_armour_break", "memeSound_1/sound/stuffs/use_armor_break_player" )
		RemapSoundEvent( "dontstarve/wilson/use_break", "memeSound_1/sound/stuffs/use_tools_break_player" )
	end
end

if GetModConfigData("sound_stuffs_2") then
	RemapSoundEvent( "dontstarve/common/wardrobe_active", "memeSound_1/sound/stuffs/wardrobe_active")
end

-- Check if there is anything to do with TheWorld:PushEvent("ms_newplayerspawned", inst) | also consider adding "spawn_fx_small_high" or "spawn_fx_small"
if GetModConfigData("sound_stuffs_3") then
	RemapSoundEvent( "dontstarve/common/spawn/spawnportal_spawnplayer", "memeSound_1/sound/stuffs/characterspawn")

	AddPrefabPostInit("world", function(inst)
		inst:ListenForEvent("playerentered", function(inst, data)
			if data == nil then return end
			data.SoundEmitter:PlaySound("memeSound_1/sound/stuffs/characterspawn")
		end)
	end)
end

if GetModConfigData("sound_stuffs_4") then
	AddPrefabPostInit("fx_boat_pop", function(inst)
		GLOBAL.TheFocalPoint.SoundEmitter:PlaySound("memeSound_1/sound/stuffs/boat_break")
	end)
end

if GetModConfigData("sound_stuffs_5") then
	RemapSoundEvent( "dontstarve/wilson/blowdart_shoot", "memeSound_1/sound/stuffs/blowdart_shoot")
end
----------------------------------------------------------------------------------------------------------------------------------------------------
if GetModConfigData("sound_game_1") then
	RemapSoundEvent( "dontstarve/HUD/Together_HUD/player_receives_gift_animation", "memeSound_1/sound/game/gift_open")
end

if GetModConfigData("sound_game_2") then
	AddComponentPostInit("playercontroller", function(self, inst)
		if inst ~= GLOBAL.ThePlayer then return end

		local OriginalOnLeftClick = self.OnLeftClick
		self.OnLeftClick = function(self, down)
			local act = self:GetLeftMouseAction()
			if act and down then
				if act.action == GLOBAL.ACTIONS.LOOKAT and act.target.prefab == "skeleton_player" and not self.ismastersim then
					GLOBAL.TheFocalPoint.SoundEmitter:PlaySound("memeSound_1/sound/game/examine_skeleton")
				end
			end
			OriginalOnLeftClick(self, down)
		end

		-- I'm keeping this since im not sure if any mod will make it examinable with right click only
		local OriginalOnRightClick = self.OnRightClick
		self.OnRightClick = function(self, down)
			local act = self:GetRightMouseAction()
			if act and down then
				if act.action == GLOBAL.ACTIONS.LOOKAT and act.target.prefab == "skeleton_player" and not self.ismastersim then
					GLOBAL.TheFocalPoint.SoundEmitter:PlaySound("memeSound_1/sound/game/examine_skeleton")
				end
			end
			OriginalOnRightClick(self, down)
		end
	end)
end

----------------------------------------------------------------------------------------------------------------------------------------------------
if GetModConfigData("sound_player_1") then
	RemapSoundEvent( "dontstarve/wilson/eat", "memeSound_1/sound/player/eat" )
end

-- Don't forget to fix this sound
if GetModConfigData("sound_player_2") then
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
if GetModConfigData("sound_player_3") then
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

if GetModConfigData("sound_player_4") then
	if GetModConfigData("sound_player_4") == 2 then
		AddPlayerPostInit(function(player)
			local anim = ""
			if player._disgustedSoundTask ~= nil then return end

			local SoundTask
			SoundTask = function()
				anim = GetCurrentAnimation(player)
				if anim == "refuseeat" then
					player._disgustedSoundTask:Cancel()
					player.SoundEmitter:PlaySound("memeSound_1/sound/player/refuseeat")
					player._disgustedSoundTask = player:DoTaskInTime(3, function()
						player._disgustedSoundTask = player:DoPeriodicTask(0.5, SoundTask)
					end)
				end
			end

			player._disgustedSoundTask = player:DoPeriodicTask(0.5, SoundTask)
		end)
	else
		modimport("scripts/disgusted_food")
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------
if GetModConfigData("sound_npc_1") then
	STRINGS.NAMES.WORMHOLE = "Ohm"
	RemapSoundEvent( "dontstarve/common/teleportworm/open", "memeSound_1/sound/npc/teleportworm_enter" )
	RemapSoundEvent( "dontstarve/common/teleportworm/travel", "memeSound_1/sound/npc/teleportworm_travel" )
	RemapSoundEvent( "dontstarve/common/teleportworm/swallow", "memeSound_1/base/silence" )
end

if GetModConfigData("sound_npc_2") then
	RemapSoundEvent( "dontstarve/charlie/warn", "memeSound_1/sound/npc/charlie_warn" )
	RemapSoundEvent( "dontstarve/charlie/attack", "memeSound_1/sound/npc/charlie_attack" )
end

if GetModConfigData("sound_npc_3") then
	RemapSoundEvent( "dontstarve/pig/PigKingThrowGold", "memeSound_1/sound/npc/pigking_gold")
end

if GetModConfigData("sound_npc_4") then
	RemapSoundEvent( "dontstarve_DLC001/creatures/deciduous/angry", "memeSound_1/sound/npc/deciduous_gnash" )
end

if GetModConfigData("sound_npc_5") then
	AddPrefabPostInit("animal_track", function(inst)
		local track = inst
		scheduler:ExecuteInTime(0.1, function()
			local pos = GLOBAL.Vector3(track.Transform:GetWorldPosition())

			if GetNearbyPrefabsCondition(pos, 4, nil, true) then
				PlaySoundSFX(track, "memeSound_1/sound/npc/animal_track_hunt")
			end
		end)
	end)
end

if GetModConfigData("sound_npc_6") then
	local antlion_fx_prefabs = {"sinkhole_warn_fx_1", "sinkhole_warn_fx_2", "sinkhole_warn_fx_3", "cavein_debris"}
	sound_delay.antlion = nil

	for _, prefab in pairs(antlion_fx_prefabs) do
		AddPrefabPostInit(prefab, function(inst)
			local fx = inst
			if sound_delay.antlion == nil and GLOBAL.TheWorld.state.issummer then
				scheduler:ExecuteInTime(0.1, function()
					local pos = GLOBAL.Vector3(fx.Transform:GetWorldPosition())

					if sound_delay.antlion == nil and GetNearbyPrefabsCondition(pos, 10, nil, true) then
						sound_delay.antlion = scheduler:ExecuteInTime(1, function() sound_delay.antlion = nil end)
						PlaySoundSFX(fx, "dontstarve/creatures/together/antlion/cast_pre")
					end
				end)
			end
		end)
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------------
--   Character Sounds
----------------------------------------------------------------------------------------------------------------------------------------------------
if GetModConfigData("character_wolfgang") then
	RemapSoundEvent( "wolfgang2/characters/wolfgang/wimpy", "memeSound_1/character/wolfgang/wimpy" )
	RemapSoundEvent( "wolfgang2/characters/wolfgang/mighty", "memeSound_1/character/wolfgang/mighty" )
	RemapSoundEvent( "wolfgang1/dumbbell/stone_impact", "memeSound_1/character/wolfgang/dumbel" )
	RemapSoundEvent( "wolfgang1/dumbbell/gold_impact", "memeSound_1/character/wolfgang/dumbel" )
	RemapSoundEvent( "wolfgang1/dumbbell/gem_impact", "memeSound_1/character/wolfgang/dumbel" )
	RemapSoundEvent( "meta2/wolfgang/critical_work", "memeSound_1/character/wolfgang/critwork" )
	RemapSoundEvent( "wolfgang2/common/gym/success", "memeSound_1/character/wolfgang/gym_success" )
	RemapSoundEvent( "dontstarve/characters/wolfgang/death_voice", "memeSound_1/character/wolfgang/death_voice" )
end

if GetModConfigData("character_wigfrid") then
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/song/durability", "memeSound_1/character/wigfrid/song_weapon" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/song/fireresistance", "memeSound_1/character/wigfrid/song_fire" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/song/sanitygain", "memeSound_1/character/wigfrid/song_sanity" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/song/sanityaura", "memeSound_1/character/wigfrid/song_sanityaura" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/song/healthgain", "memeSound_1/character/wigfrid/song_health" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/quote/taunt", "memeSound_1/character/wigfrid/quote_taunt" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/quote/dropattack", "memeSound_1/character/wigfrid/quote_scare" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/death_voice", "memeSound_1/character/wigfrid/death_voice" )
	RemapSoundEvent( "dontstarve_DLC001/characters/wathgrithr/fail", "memeSound_1/character/wigfrid/fail" )
end

if GetModConfigData("character_wendy") then
	RemapSoundEvent( "dontstarve/characters/wendy/death_voice", "memeSound_1/character/wendy/death_voice" )
	RemapSoundEvent( "dontstarve/characters/wendy/sisturn/place", "memeSound_1/character/wendy/sisturn" )
	RemapSoundEvent( "dontstarve/characters/wendy/abigail/level_change/1", "memeSound_1/character/wendy/levelup_1" )
	RemapSoundEvent( "dontstarve/characters/wendy/abigail/level_change/2", "memeSound_1/character/wendy/levelup_2" )
	-- RemapSoundEvent( "dontstarve/characters/wendy/summon_pre", "memeSound_1/character/wendy/" )
	RemapSoundEvent( "dontstarve/characters/wendy/summon", "memeSound_1/character/wendy/summon" )
	RemapSoundEvent( "dontstarve/characters/wendy/recall", "memeSound_1/character/wendy/recall" )
	RemapSoundEvent( "dontstarve/characters/wendy/abigail/buff/gen", "memeSound_1/character/wendy/gen" )
	RemapSoundEvent( "dontstarve/characters/wendy/abigail/buff/shield", "memeSound_1/character/wendy/shield" )
	RemapSoundEvent( "dontstarve/characters/wendy/abigail/buff/attack", "memeSound_1/character/wendy/attack" )
	RemapSoundEvent( "dontstarve/characters/wendy/abigail/buff/speed", "memeSound_1/character/wendy/speed" )
	RemapSoundEvent( "dontstarve/characters/wendy/abigail/buff/retaliation", "memeSound_1/character/wendy/thorn" )
end


-- self:WatchWorldState("cycles", OnDayComplete)

-- ThePlayer.SoundEmitter:PlaySound(

-- "dontstarve/creatures/together/antlion/sfx/ground_break"    -- use in a lot of breaking sounds

-- "dontstarve/creatures/together/antlion/taunt"
-- "dontstarve/creatures/together/antlion/eat"
-- "dontstarve/creatures/together/antlion/swallow"
-- "dontstarve/creatures/together/antlion/purr"
-- "dontstarve/creatures/together/antlion/rub"
-- "dontstarve/creatures/together/antlion/unimpressed"
-- "dontstarve/creatures/together/antlion/spit"
-- "dontstarve/creatures/together/antlion/sfx/break_spike"

-- "dontstarve/creatures/together/antlion/attack_pre"
-- "dontstarve/creatures/together/antlion/cast_pre"
-- "dontstarve/creatures/together/antlion/cast_post"

-- "dontstarve/creatures/together/antlion/sleep_in"
-- "dontstarve/creatures/together/antlion/sleep_out"

-- Glass spike
-- "dontstarve/creatures/together/antlion/sfx/sand_to_glass"  (glass_fx)
-- "dontstarve/creatures/together/antlion/sfx/glass_break"    (prob hammer glass_fx)

-- Sand spike
-- "dontstarve/creatures/together/antlion/sfx/break"
-- "dontstarve/creatures/together/antlion/sfx/break_spike"
-- "dontstarve/creatures/together/antlion/sfx/block"


-- "dontstarve/creatures/together/antlion/hit"

-- "dontstarve/creatures/together/antlion/death"
-- "dontstarve/creatures/together/antlion/bodyfall_death"


-- "dontstarve/wilson/flute_LP"  SG: play_flute 
-- "dontstarve/common/horn_beefalo"               Horn Beefalo
-- "dontstarve/common/together/houndwhistle"      Hound Whistle
-- "hookline_2/characters/trident_attack"         Trident

-- "dontstarve/common/together/dragonfly_furnace/place"   Dragonfly Furnace Place
-- "dontstarve/common/cookingpot_finish"                  Cooking Pot Finish

-- "dontstarve/cave/nightmare_warning"
-- "dontstarve/cave/nightmare_full"
-- "dontstarve/cave/nightmare_end"

-- "dontstarve/pig/pighut_lighton"
-- "dontstarve/pig/pighut_lightoff"


--[[
	Warg
    idle = "dontstarve_DLC001/creatures/vargr/idle",
    howl = "dontstarve_DLC001/creatures/vargr/howl",
    hit = "dontstarve_DLC001/creatures/vargr/hit",
    attack = "dontstarve_DLC001/creatures/vargr/attack",
    death = "dontstarve_DLC001/creatures/vargr/death",
    sleep = "dontstarve_DLC001/creatures/vargr/sleep",

	idle = "rifts3/mutated_varg/idle",
	howl = "rifts3/mutated_varg/howl",
	hit = "rifts3/mutated_varg/hit",
	attack = "rifts3/mutated_varg/attack",
	death = "rifts3/mutated_varg/death",
	sleep = "rifts3/mutated_varg/sleep",

	"rifts3/mutated_varg/mutate_pre_f0"
	"rifts3/mutated_varg/mutate_pre_f14"
	"rifts3/mutated_varg/mutate"

	Chomp
	"rifts3/chewing/warg"

	Flame Thrower
	"rifts3/mutated_varg/blast_pre_f0"
	"rifts3/mutated_varg/blast_pre_f17"
	"rifts3/mutated_varg/blast_lp"
	"rifts3/mutated_varg/blast_pst"

	Stagger : pre = hit | pst = sleep , idle
]]

-- Gobbler, Krampus, Pig?, Rabbit , Slurper, Smallbird
-- Tentacle, buzzard, volt goat, mosling?, 
-- Antlion, malbatross, saladmander, new shark
-- Shadow chess

--[[
	Sharkboi
	Talk?
	ThePlayer.SoundEmitter:PlaySound(
	"meta3/sharkboi/talk"	(also play when torpedo_pst)

	"meta3/sharkboi/spawn"

	"meta3/sharkboi/hit"
	Swipe "meta3/sharkboi/attack_small" + "meta3/sharkboi/swipe_arm"
	Tail "meta3/sharkboi/attack_big" + "meta3/sharkboi/swipe_tail"
	Ice summon play both small then big  then go torpedo state
	Torpedo pre with attack_small then attack_big and jump with "meta3/sharkboi/torpedo_drill"

	dive_jump "meta3/sharkboi/popup" , attack_big  
	dive_dig_pre "meta3/sharkboi/divedown", "meta3/sharkboi/feetsies_wiggle_LP"
	dive_dig_pst or stun : popup

	"meta3/sharkboi/movement_thru_ice"

	defeat "meta3/sharkboi/stunned_pre", "meta3/sharkboi/stunned_hit", "meta3/sharkboi/stunned_pst"
	"meta3/sharkboi/sleep_pre", "meta3/sharkboi/sleep_pst", "meta3/sharkboi/sleep_lp"


	Tentacle
	"dontstarve/tentacle/tentacle_emerge"
	"dontstarve/tentacle/tentacle_emerge_VO"
	"dontstarve/tentacle/tentacle_attack"
	"dontstarve/tentacle/tentacle_disappear"
	"dontstarve/tentacle/tentacle_death_VO"
	"dontstarve/tentacle/tentacle_splat"
	"dontstarve/tentacle/tentacle_hurt_VO"
]]