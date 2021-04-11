--------------------------------------------------------------------------------------------------------------------------------
-- unlockList
--------------------------------------------------------------------------------------------------------------------------------
local TagHandlerList = {
	"IsSpellInRange",
	"IsItemInRange",
	"UnitInRange",
	"UnitAura",
	"UnitAuraSlots",
	"UnitPlayerControlled",
	"UnitIsVisible",
	"GetUnitSpeed",
	"UnitClass",
	"UnitIsTappedByPlayer",
	"UnitThreatSituation",
	"UnitCanAttack",
	"UnitCreatureType",
	"UnitIsDeadOrGhost",
	"UnitDetailedThreatSituation",
	"UnitIsUnit",
	"UnitHealthMax",
	"UnitAffectingCombat",
	"UnitIsPlayer",
	"UnitIsDead",
	"UnitInParty",
	"UnitInRaid",
	"UnitHealth",
	"UnitCastingInfo",
	"UnitChannelInfo",
	"UnitName",
	"UnitBuff",
	"UnitDebuff",
	-- "CanLootUnit",
	"UnitIsFriend",
	"UnitClassification",
	"UnitReaction",
	"UnitGroupRolesAssigned",
	-- "SetPortraitTexture",
	"UnitXPMax",
	"UnitXP",
	-- "UnitUsingVehicle",
	"UnitStat",
	-- "UnitSex",
	-- "UnitSelectionColor",
	"UnitPhaseReason",
	"UnitResistance",
	"UnitRangedDamage",
	"UnitRangedAttackPower",
	"UnitRangedAttack",
	"UnitRace",
	"UnitPowerType",
	"UnitPowerMax",
	"UnitPower",
	"UnitPVPName",
	"UnitPlayerOrPetInRaid",
	"UnitPlayerOrPetInParty",
	"UnitManaMax",
	"UnitMana",
	"UnitLevel",
	"UnitIsTrivial",
	"UnitIsTapped",
	"UnitIsSameServer",
	"UnitIsPossessed",
	-- "UnitIsPVPSanctuary",
	-- "UnitIsPVPFreeForAll",
	"UnitIsPVP",
	"UnitIsGhost",
	"UnitIsFeignDeath",
	"UnitIsEnemy",
	"UnitIsDND",
	"UnitIsCorpse",
	"UnitIsConnected",
	"UnitIsCharmed",
	-- "UnitIsAFK",
	-- "UnitIsInMyGuild",
	"UnitInBattleground",
	-- "GetPlayerInfoByGUID",
	-- "UnitDefense",
	"UnitDamage",
	"UnitCreatureFamily",
	"UnitCanCooperate",
	"UnitCanAssist",
	"UnitAttackSpeed",
	"UnitAttackPower",
	"UnitAttackBothHands",
	"UnitArmor",
	-- "InviteUnit",
	"GetUnitPitch",
	-- "GetUnitName",
	"FollowUnit",
	"CheckInteractDistance",
	"InitiateTrade",
	"UnitOnTaxi",
	"AssistUnit",
	"SpellTargetUnit",
	"CopyToClipboard",
	"SpellTargetItem",
	"SpellCanTargetUnit",
	-- "CombatTextSetActiveUnit",
	-- "SummonFriend",
	-- "CanSummonFriend",
	-- "GrantLevel",
	-- "CanGrantLevel",
	"SetRaidTarget",
	-- "GetReadyCheckStatus",
	"GetRaidTargetIndex",
	-- "GetPartyAssignment",
	-- "DemoteAssistant",
	-- "PromoteToAssistant",
	"IsUnitOnQuest",
	"DropItemOnUnit",
	"GetDefaultLanguage",
	"GetCritChanceFromAgility",
	"GetSpellCritChanceFromIntellect",
	"UnitGetTotalHealAbsorbs",
	"UnitGetIncomingHeals",
	"CastSpellByName",
	"CastSpellByID",
	"UseItemByName",
	"SpellIsTargeting",
	"InteractUnit",
	"CancelUnitBuff",
	"TargetUnit",
	"UnitGUID",
	"UnitExists"
}
local UnlockList = {
	"ToggleGameMenu",
	"RunMacroText",
	"UseInventoryItem",
	"SpellStopCasting",
	"CameraOrSelectOrMoveStart",
	"CameraOrSelectOrMoveStop",
	"CancelShapeshiftForm",
	"PetAssistMode",
	"PetPassiveMode",
	"SpellStopTargeting",
	"AscendStop",
	"JumpOrAscendStart",
	"JumpOrAscendStop",
	"MoveBackwardStart",
	"MoveBackwardStop",
	"MoveForwardStart",
	"StrafeLeftStart",
	"StrafeLeftStop",
	"StrafeRightStart",
	"StrafeRightStop",
	"TurnLeftStart",
	"TurnLeftStop",
	"TurnRightStart",
	"TurnRightStop",
	"PitchUpStart",
	"PitchDownStart",
	"PitchDownStop",
	"ClearTarget",
	"AcceptProposal",
	"CastPetAction",
	"CastShapeshiftForm",
	"CastSpell",
	"ChangeActionBarPage",
	"ClearOverrideBindings",
	"CreateMacro",
	"DeleteCursorItem",
	"DeleteMacro",
	"DescendStop",
	"DestroyTotem",
    "DisableSpellAutocast",
	"FocusUnit",
	"ForceQuit",
	"GetUnscaledFrameRect",
	"GuildControlSetRank",
	"GuildControlSetRankFlag",
	"GuildDemote",
	"GuildPromote",
	"GuildUninvite",
	"JoinBattlefield",
	"Logout",
	"PetAttack",
	"PetDefensiveAssistMode",
	"PetDefensiveMode",
	"PetFollow",
	"PetStopAttack",
	"PetWait",
	"PickupAction",
	"PickupCompanion",
	"PickupMacro",
	"PickupPetAction",
	"PickupSpell",
	"PickupSpellBookItem",
	"Quit",
	"Region_GetBottom",
	"Region_GetCenter",
	"Region_GetPoint",
	"Region_GetRect",
	"Region_Hide",
	"Region_SetPoint",
	"Region_Show",
	"RegisterForSave",
	"ReplaceEnchant",
	"ReplaceTradeEnchant",
	"RunMacro",
	"SendChatMessage",
	"SetBinding",
	"SetBindingClick",
	"SetBindingItem",
	"SetBindingMacro",
	"SetBindingSpell",
	"SetCurrentTitle",
	"SetMoveEnabled",
	"SetOverrideBinding",
	"SetOverrideBindingClick",
	"SetOverrideBindingItem",
	"SetOverrideBindingMacro",
	"SetOverrideBindingSpell",
	"SetTurnEnabled",
	"ShowUIPanel",
	"SitStandOrDescendStart",
	-- "Stuck",
	-- "SwapRaidSubgroup",
	"TargetLastEnemy",
	"TargetLastTarget",
	"TargetNearestEnemy",
	"TargetNearestFriend",
	-- "ToggleAutoRun",
	-- "ToggleRun",
	"TurnOrActionStart",
	"TurnOrActionStop",
	-- "UIObject_SetForbidden",
	-- "UninviteUnit",
	"UseAction",
	-- "UseContainerItem",
	"UseToy",
	"UseToyByName",
	-- "AcceptBattlefieldPort",
	"AcceptTrade",
	"AttackTarget",
	-- "CancelItemTempEnchantment",
	"CancelLogout",
	"StartAttack"
}

--------------------------------------------------------------------------------------------------------------------------------
-- functions exported to BadRotations
--------------------------------------------------------------------------------------------------------------------------------
local _, psy = ...
local p = psy.Protected
local g = psy.useGUID
local wa = nil
local funcTagCopies = {}
local funcUnlockCopies

-- helper function
local function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, str)
	end
	return t
end

-- obtain references to WA APIs from the BadRotations plugin
if _G.BR_WA then
	wa = _G.BR_WA
	_G.BR_WA = nil
	
	-- make a backup copy of all APIs before AddOns hook them
	for i = 1, #TagHandlerList do
		local func = TagHandlerList[i]
		funcTagCopies[func] = _G[func]
	end
    for i = 1, #UnlockList do
		local func = UnlockList[i]
		funcUnlockCopies[func] = _G[func]
	end
else
	-- either not WA or BR addon is not enabled
end


function WowAdUnlock()
	if not wa then
		return false
	end
	--------------------------------
	-- API unlocking
	--------------------------------
	for k, v in pairs(funcTagCopies) do
		g[k] = function(...) return wa.CallSecureFunction(v, ...) end
	end
    for k, v in pairs(funcUnlockCopies) do
		p[k] = function(...) return wa.CallSecureFunction(v, ...) end
	end
	
	--------------------------------
	-- API copy/rename/unlock
	--------------------------------
	p.ReadFile = wa.ReadFile
	p.DirectoryExists = wa.DirectoryExists
	p.WriteFile = wa.WriteFile
	p.ClickPosition = wa.ClickPosition
	p.CreateDirectory = wa.CreateDirectory
	p.GetKeyState = wa.GetKeyState
	p.ObjectName = wa.ObjectName
    p.GetObjectWithIndex = wa.GetObjectWithIndex
	p.ObjectPosition = wa.GetUnitPosition
	p.UnitMovementFlags = wa.GetUnitMovementFlags
	p.GetWoWDirectory = wa.GetWowDirectory
    p.ObjectFacing = wa.UnitFacing
	p.GetMousePosition = _G.GetCursorPosition
	p.ObjectExists = wa.ObjectExists
	p.GetCameraPosition = wa.GetCameraPosition
	p.CancelPendingSpell = p.SpellStopTargeting	
	p.ObjectIsVisible = g.UnitIsVisible
	p.IsAoEPending = p.SpellIsTargeting
	p.ObjectInteract = g.InteractUnit
	
	--------------------------------
	-- object fields
	--------------------------------
	p.UnitTarget = function(unit)
		return wa.ObjectField(unit, 0x1C58, 15)
	end
	p.UnitCreator = function(unit)
		return wa.ObjectField(unit, 0x13C8, 15)
	end
	p.UnitCombatReach = function(unit)
		return wa.ObjectField(unit, 0x1CF0, 10)
	end
	
	--------------------------------
	-- API conversions
	--------------------------------
	p.ObjectPointer = function(...)
		if g.UnitExists(...) then
			return g.UnitGUID(...)
		end
	end
	p.ObjectIsUnit = function(...)
		local ObjType = wa.ObjectType(...)
		return ObjType == 5 or ObjType == 6 or ObjType == 7
	end
	p.ObjectID = function(object)
		local guid = g.UnitGUID(object)   
		if guid then
			local _, _, _, _, _, objectId, _ = _G.strsplit("-", guid);
			return tonumber(objectId);
		else
			return 0
		end
	end
	p.TraceLine = function(...)
		local hit, hitx, hity, hitz = wa.TraceLine(...)
		if hit == 1 then
			return hitx, hity, hitz
		else
			return nil
		end
	end
	p.UnitCastID = function(...)
		local spellId1 = select(9, g.UnitCastingInfo(...)) or 0
		local spellId2 = select(9, g.UnitChannelInfo(...)) or 0
		local castGUID = g.UnitTarget(select(1,...))
		return spellId1, spellId2, castGUID, castGUID
	end
	p.GetDirectoryFiles = function(...)
		local filter = stringsplit(..., "*")
		local files = wa.GetDirectoryFiles(filter[1], "*.lua")
		return stringsplit(files, "|")
	end
	p.WorldToScreen = function(...)
		local multiplier = _G.UIParent:GetScale()
		local sX, sY = wa.WorldToScreen(...)
		return sX * multiplier, -sY * multiplier
	end	
	p.FaceDirection = function(arg)
		if type(arg) == "number" then
			wa.FaceDirection(arg)
		else
			arg = p.GetAnglesBetweenObjects("player", arg)
			wa.FaceDirection(arg)
		end
	end
	p.GetObjectWithGUID = function(...)
		return ...
	end
	--------------------------------
	-- math
	--------------------------------
	p.GetDistanceBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2)
		return math.sqrt(math.pow(X2 - X1, 2) + math.pow(Y2 - Y1, 2) + math.pow(Z2 - Z1, 2))
	end
	p.GetAnglesBetweenObjects = function(Object1, Object2)
		local X1, Y1, Z1 = p.ObjectPosition(Object1)
		local X2, Y2, Z2 = p.ObjectPosition(Object2)
        if not X1 or not X2 then return math.huge end
		return math.atan2(Y2 - Y1, X2 - X1) % (math.pi * 2), 
			math.atan((Z1 - Z2) / math.sqrt(math.pow(X1 - X2, 2) + math.pow(Y1 - Y2, 2))) % math.pi
	end
	p.GetAnglesBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2)
		return math.atan2(Y2 - Y1, X2 - X1) % (math.pi * 2),
			math.atan((Z1 - Z2) / math.sqrt(math.pow(X1 - X2, 2) + math.pow(Y1 - Y2, 2))) % math.pi
	end
	p.GetPositionFromPosition = function(X, Y, Z, Distance, AngleXY, AngleXYZ)
		return math.cos(AngleXY) * Distance + X, math.sin(AngleXY) * Distance + Y, math.sin(AngleXYZ) * Distance + Z
	end
	p.GetPositionBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2, DistanceFromPosition1)
		local AngleXY, AngleXYZ = p.GetAnglesBetweenPositions(X1, Y1, Z1, X2, Y2, Z2)
		return p.GetPositionFromPosition(X1, Y1, Z1, DistanceFromPosition1, AngleXY, AngleXYZ)
	end
	p.GetPositionBetweenObjects = function(unit1, unit2, DistanceFromPosition1)
		local X1, Y1, Z1 = p.ObjectPosition(unit1)
		local X2, Y2, Z2 = p.ObjectPosition(unit2)
        if not X1 or not X2 then return math.huge end
		local AngleXY, AngleXYZ = p.GetAnglesBetweenPositions(X1, Y1, Z1, X2, Y2, Z2)
		return p.GetPositionFromPosition(X1, Y1, Z1, DistanceFromPosition1, AngleXY, AngleXYZ)
	end
	p.GetDistanceBetweenObjects = function(X1, Y1, Z1, X2, Y2, Z2)
		return math.sqrt(math.pow(X2 - X1, 2) + math.pow(Y2 - Y1, 2) + math.pow(Z2 - Z1, 2))
	end
	p.ObjectIsFacing = function(obj1, obj2, degrees)
		local Facing = wa.UnitFacing(obj1)
		local AngleToUnit = p.GetAnglesBetweenObjects(obj1, obj2)
		local AngleDifference = Facing > AngleToUnit and Facing - AngleToUnit or AngleToUnit - Facing
		local ShortestAngle = AngleDifference < math.pi and AngleDifference or math.pi * 2 - AngleDifference
		degrees = degrees and _G.rad(degrees) / 2 or math.pi / 2
		return ShortestAngle < degrees
	end
	--------------------------------
	-- extra APIs
	--------------------------------
	p.AuraUtil = {}
	p.AuraUtil.FindAuraByName = function(...)
		return wa.CallSecureFunction(_G.AuraUtil["FindAuraByName"], ...)
	end
	p.ObjectIsGameObject = function(...)
		local ObjType = wa.ObjectType(...)
		return ObjType == 8 or ObjType == 11
	end
	p.GetMapId = function()
		return select(8, _G.GetInstanceInfo())
	end
	--------------------------------
	-- missing APIs
	--------------------------------
	p.UnitBoundingRadius = function(...)
		return 0
	end
	p.IsQuestObject = function(obj)
		return false
	end
	p.ScreenToWorld = function()
		return 0, 0
	end
	
	--------------------------------
	-- internal unit manager
	--------------------------------
	local g_lastKnownObjectList = {}
	local g_lastObjectCount = nil
	local g_lastObjectGuid = nil
	local g_lastUpdateTick = 0
	local const_updateObjectListFastTickDelay = 3
	local const_updateObjectListAccurateTickDelay = 15

	p.GetObjectCount = function()
		local count = wa.GetObjectCount()
		if (g_lastUpdateTick < const_updateObjectListAccurateTickDelay
		and g_lastObjectCount == count
		and g_lastObjectGuid == wa.GetObjectWithIndex(count))
		or g_lastUpdateTick < const_updateObjectListFastTickDelay then
			g_lastUpdateTick = g_lastUpdateTick + 1
			return g_lastObjectCount, false, {}, {}
		else
			g_lastUpdateTick = 0
		end
		
		local currentObjects = {}    
		local added = {}
		local removed = {}
		
		for i = 1, count do
			local guid = wa.GetObjectWithIndex(i)
			if not g_lastKnownObjectList[guid] then
				added[#added + 1] = guid
			end
			g_lastKnownObjectList[guid] = true
			currentObjects[guid] = true
		end
		
		for guid, v in pairs(g_lastKnownObjectList) do
			if not currentObjects[guid] then
				removed[#removed + 1] = guid
				g_lastKnownObjectList[guid] = nil
			end
		end
		
		g_lastObjectCount = count
		g_lastObjectGuid = wa.GetObjectWithIndex(count)
		
		local updated = (#added > 0) or (#removed > 0)
		return count, updated, added, removed
	end
	return true
end