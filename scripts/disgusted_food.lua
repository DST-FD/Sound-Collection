local CacheItem = require("food_cache")
local sound_delay_food = nil
local FOODTYPE_CACHED = {}

local omni_food_type = {MEAT = true, VEGGIE = true, SEEDS = true, INSECT = true, GENERIC = true, GOODIES = true, BERRY = true}

local scheduler = GLOBAL.scheduler
local approach = GetModConfigData("sound_player_4")

local sound = "memeSound_1/sound/player/refuseeat"

local function GetCurrentAnimation(inst)
	return string.match(inst.entity:GetDebugString(), "anim: ([^ ]+) ")
end

local function CheckFood(item)
	if not FOODTYPE_CACHED[item.prefab] then
		local IsMasterSim = GLOBAL.TheWorld.ismastersim
		GLOBAL.TheWorld.ismastersim = true

		local inst_copy = GLOBAL.SpawnPrefab(item.prefab)
		FOODTYPE_CACHED[item.prefab] = CacheItem(inst_copy)

		inst_copy:Remove()
		GLOBAL.TheWorld.ismastersim = IsMasterSim
	end

	local base_inst = FOODTYPE_CACHED[item.prefab]
	local foodtype = base_inst.components.edible and base_inst.components.edible.foodtype or nil
	local freshness = base_inst.components.edible and item.replica.inventoryitem.classified.perish:value() / 62 or nil

	foodtype = omni_food_type[foodtype] and foodtype or nil
	if freshness and freshness < 0.2 then
		return foodtype, true
	end
	return foodtype, false
end

local function PlayDisgustedSound(item, foodType, isSpoiled)
	if foodType == nil then return end

	local FOODTYPE = GLOBAL.FOODTYPE
	local eternal_cake = item.prefab == "winter_food4"
	local meatEater = GLOBAL.ThePlayer.prefab == "wathgrithr" and foodType == FOODTYPE.VEGGIE
	local veganEater = GLOBAL.ThePlayer.prefab == "wurt" and foodType == FOODTYPE.MEAT
	local freshEater = GLOBAL.ThePlayer.prefab == "warly" and not (item:HasTag("preparedfood") or item:HasTag("pre-preparedfood")) and omni_food_type[foodType]
	local cuisineEater = GLOBAL.ThePlayer.prefab == "wickerbottom" and isSpoiled

	if not (eternal_cake or meatEater or veganEater or freshEater or cuisineEater) then
		return
	end
	GLOBAL.TheFocalPoint.SoundEmitter:PlaySound(sound)
	sound_delay_food = scheduler:ExecuteInTime(1.5, function() sound_delay_food = nil end)
end

-- On click over character
AddComponentPostInit("playercontroller", function(self, inst)
	if inst ~= GLOBAL.ThePlayer then return end
    local active_item, mouse_target

	local OriginalOnLeftClick = self.OnLeftClick
	self.OnLeftClick = function(self, down)
		local act = self:GetLeftMouseAction()
		if act and down then
			if active_item and mouse_target == GLOBAL.ThePlayer and sound_delay_food == nil then

				if approach == 3 then		-- Check Food Values
					local foodType, isSpoiled = CheckFood(active_item)
					PlayDisgustedSound(active_item, foodType, isSpoiled)
				else	-- Check Animation
					scheduler:ExecuteInTime(0.1, function()
						if GetCurrentAnimation(GLOBAL.ThePlayer) == "refuseeat" then
							GLOBAL.ThePlayer.SoundEmitter:PlaySound(sound)
							sound_delay_food = scheduler:ExecuteInTime(1.5, function() sound_delay_food = nil end)
						end
					end)
				end

			end
		end

		OriginalOnLeftClick(self, down)
	end

	local PlayerControllerOnUpdate = self.OnUpdate
	self.OnUpdate = function(self, dt)
		active_item = GLOBAL.ThePlayer.replica.inventory:GetActiveItem()
		mouse_target = GLOBAL.TheInput:GetWorldEntityUnderMouse()
		PlayerControllerOnUpdate(self, dt)
	end
end)

-- Use item
AddClassPostConstruct("components/inventory_replica", function(self)
	local OldUseItemFromInvTile = self.UseItemFromInvTile
	self.UseItemFromInvTile = function(self, item)
		if item and not self:GetActiveItem() and sound_delay_food == nil then

			if approach == 3 then		-- Check Food Values
				local foodType, isSpoiled = CheckFood(item)
				PlayDisgustedSound(item, foodType, isSpoiled)
			else	-- Check Animation
				scheduler:ExecuteInTime(0.1, function()
					if GetCurrentAnimation(GLOBAL.ThePlayer) == "refuseeat" then
						GLOBAL.ThePlayer.SoundEmitter:PlaySound(sound)
						sound_delay_food = scheduler:ExecuteInTime(1.5, function() sound_delay_food = nil end)
					end
				end)
			end

		end
		OldUseItemFromInvTile(self, item)
	end
end)