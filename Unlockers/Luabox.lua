local _, psy = ...
local p = psy.Protected
local g = psy.useGUID

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
function LBUnlock()
	local unlocked = false
	local lb = _G.__LB__
	
    local function lbUnlock(method)
		p[method] = function(...)
			return lb.Unlock(_G[method], ...)
		end
	end
	local function lbUnitTagHandler(method)
		g[method] = function(...)
			return lb.UnitTagHandler(_G[method], ...)
		end
	end
	for _, method in ipairs(TagHandlerList) do
		lbUnitTagHandler(method)
	end
	for _, method in ipairs(UnlockList) do
		lbUnlock(method)
	end
	p.GetCameraPosition = function(...) return lb.GetCameraPosition(...) end
	g.AuraUtil = {}
	g.AuraUtil.FindAuraByName = function(...)
		return lb.UnitTagHandler(lb.Unlock, _G.AuraUtil["FindAuraByName"], ...)
	end
	p.ObjectPointer = g.UnitGUID --compatibility change as LB returns GUIDs instead of Pointers in their OM
	p.ObjectPosition = function(...)
		return lb.ObjectPosition(...)
	end
	g.ObjectGUID = g.UnitGUID
	p.ObjectIsUnit = function(...)
		local ObjType = lb.ObjectType(...)
		return ObjType == 5 or ObjType == 6 or ObjType == 7
	end
	p.ObjectIsGameObject = function(...)
		local ObjType = lb.ObjectType(...)
		return ObjType == 8 or ObjType == 11
	end
	p.ObjectID = function(...)
		return lb.ObjectId(...)
	end
	p.UnitMovementFlags = function(...)
		return lb.UnitMovementFlags(...)
	end
	p.TraceLine = function(...)
		return lb.Raycast(...)
	end
	p.UnitTarget = lb.UnitTarget
	p.UnitCastID = function(...)
		local CastSpellID, CastTargetGUID, timeLeft, NotInterruptible = lb.UnitCastingInfo(...)
		local ChannelSpellID, ChannelTargetGUID, timeLeft, NotInterruptible = lb.UnitChannelInfo(...)
		return CastSpellID, ChannelSpellID, CastTargetGUID, ChannelTargetGUID
	end
	p.GetWoWDirectory = lb.GetGameDirectory
	p.CreateDirectory = lb.CreateDirectory
	p.GetDirectoryFiles = lb.GetFiles
	p.GetKeyState = lb.GetKeyState
	p.WorldToScreen = function (...)
		local ResolutionCoef = _G.WorldFrame:GetWidth() / lb.GetWindowSize()
		local sX, sY = lb.WorldToScreen(...)
		if sX and sY then
			return sX * ResolutionCoef, -sY * ResolutionCoef
		else
			return sX, sY
		end
	end
	p.GetDistanceBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2)
		return math.sqrt(math.pow(X2 - X1, 2) + math.pow(Y2 - Y1, 2) + math.pow(Z2 - Z1, 2))
	end

	p.GetAnglesBetweenObjects = function(Object1, Object2)
		local X1, Y1, Z1 = p.ObjectPosition(Object1)
		local X2, Y2, Z2 = p.ObjectPosition(Object2)
		-- print(Unit1,X1,Y1,Z1,unit2,X2,Y2,Z2)
		return math.atan2(Y2 - Y1, X2 - X1) % (math.pi * 2), math.atan((Z1 - Z2) / math.sqrt(math.pow(X1 - X2, 2) + math.pow(Y1 - Y2, 2))) % math.pi
	end

	p.GetAnglesBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2)
		return math.atan2(Y2 - Y1, X2 - X1) % (math.pi * 2), math.atan((Z1 - Z2) / math.sqrt(math.pow(X1 - X2, 2) + math.pow(Y1 - Y2, 2))) % math.pi
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
		local AngleXY, AngleXYZ = p.GetAnglesBetweenPositions(X1, Y1, Z1, X2, Y2, Z2)
		return p.GetPositionFromPosition(X1, Y1, Z1, DistanceFromPosition1, AngleXY, AngleXYZ)
	end
	p.ObjectFacing = lb.ObjectFacing
	p.FaceDirection = function(arg)
		if type(arg) == "number" then
			lb.SetPlayerAngles(arg)
		else
			arg = p.GetAnglesBetweenObjects("player", arg)
			lb.SetPlayerAngles(arg)
		end
	end
	p.ObjectIsFacing = function(obj1, obj2, degrees)
		local Facing = lb.ObjectFacing(obj1)
		local AngleToUnit = p.GetAnglesBetweenObjects(obj1, obj2)
		local AngleDifference = Facing > AngleToUnit and Facing - AngleToUnit or AngleToUnit - Facing
		local ShortestAngle = AngleDifference < math.pi and AngleDifference or math.pi * 2 - AngleDifference
		degrees = degrees and _G.rad(degrees) / 2 or math.pi / 2
		return ShortestAngle < degrees
	end
	p.ObjectInteract = g.InteractUnit
	-- br.getFacing = ObjectFacingObject
	p.UnitCreator = lb.ObjectCreator
	p.ObjectName = lb.ObjectName
	p.GetDistanceBetweenObjects = function(...) return lb.GetDistance3D(...) end
	p.GetMapId = lb.GetMapId
	p.UnitIsMounted = function(...)
		return lb.UnitHasFlag(..., lb.EUnitFlags.Mount)
	end
	p.SendMovementUpdate = lb.UpdatePlayerMovement

	p.ObjectDynamicFlags = lb.ObjectDynamicFlags

	p.UnitCombatReach = lb.UnitCombatReach
	p.ReadFile = lb.ReadFile
	p.DirectoryExists = lb.DirectoryExists
	p.WriteFile = lb.WriteFile

	p.GetMousePosition = function()
		local cur_x, cur_y = g.GetCursorPosition()
		return cur_x, cur_y
	end
	p.ObjectIsVisible = lb.ObjectExists
	p.ObjectExists = lb.ObjectExists
	-- br.GetUnitIsVisible = lb.ObjectExists
	p.IsAoEPending = lb.IsAoEPending
	p.ClickPosition = function(...)
		return lb.Unlock(lb.ClickPosition, ...)  end
	p.UnitBoundingRadius = lb.UnitBoundingRadius
	p.CancelPendingSpell = lb.CancelPendingSpells
	unlocked = true
	return unlocked
end