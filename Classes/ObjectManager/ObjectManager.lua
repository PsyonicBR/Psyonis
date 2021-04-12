local _ , psy = ...
local ObjectManager = psy.Classes.ObjectManager
psy.Units, psy.Enemies = {}, {}
local Units, Enemies = psy.Units, psy.Enemies
local Unit, Player = psy.Classes.Unit, psy.Classes.Player
local p = psy.Protected
local g = psy.UseGUID

function ObjectManager:New()
    self.Count = p.GetObjectCount()
end

local function RemoveUnit(GUID)
    if psy.Tables.TTD[GUID] ~= nil then
        psy.Tables.TTD[GUID] = nil
    end
    if psy.Tables.AuraCache[GUID] ~= nil then
        psy.Tables.AuraCache[GUID] = nil
    end
end

local function UpdateUnits()
    psy.Player.Target = nil
    psy.Player.Pet = nil
    if g.UnitIsVisible("target") and Units[g.UnitGUID("target")] then
        psy.Player.Target = Unit(Units[g.UnitGUID("target")])
    end
    if g.UnitIsVisible("pet") and Units[g.UnitGUID("pet")] then
        psy.Player.Pet = Unit(Units[g.UnitGUID("pet")])
    end
end

function ObjectManager:Update()

    local _, updated, added, removed = p.GetObjectCount(true)
    if updated and #removed > 0 then
        for _, v in pairs(removed) do
            RemoveUnit(v)
        end
    end
    if updated and #added > 0 then
        for _, v in pairs(added) do
            if p.ObjectIsUnit(v) then
                Units[v] = (v)
            end
        end
    end
    psy.Player:Update()
    UpdateUnits()
end