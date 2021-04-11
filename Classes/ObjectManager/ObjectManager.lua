local _ , psy = ...
local ObjectManager = psy.Classes.ObjectManager
psy.Units, psy.Enemies = {}, {}
local Units, Enemies = psy.Units, psy.Enemies
local Unit = psy.Classes.Unit
local Debuff = psy.Classes.Debuff
local p = psy.Protected
local g = psy.UseGUID

function ObjectManager:New()
    self.Count = GetObjectCount()
end

local function RemoveUnit(GUID)
    if psy.Tables.TTD[GUID] ~= nil then
        psy.Tables.TTD[GUID] = nil
    end
    if psy.Tables.AuraCache[GUID] ~= nil then
        psy.Tables.AuraCache[GUID] = nil
    end
end

function ObjectManager:Update()
    local _, updated, added, removed = GetObjectCount(true)
    if updated and #removed > 0 then
        for _, v in pairs(removed) do
            RemoveUnit(v)
        end
    end
    if updated and #added > 0 then
        for _, v in pairs(added) do
            if p.ObjectIsUnit(v) then
                Units[v] = Unit(v)
            end
        end
    end
    table.wipe(Enemies)
end