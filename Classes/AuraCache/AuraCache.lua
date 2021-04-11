local _, psy = ...
psy.Tables.AuraCache = {}
psy.Functions.AuraCache = {}
local AuraCache = psy.Functions.AuraCache
local Buff = psy.Classes.Buff
local Debuff = psy.Classes.Debuff
local p = psy.Protected
local g = psy.useGUID

-- Credit to DMW devs for this function https://github.com/fiskee/DoMeWhen/blob/master/Classes/Aura/Cache.lua

function AuraCache.Refresh(Unit)
    if psy.Tables.AuraCache[Unit] ~= nil then
        psy.Tables.AuraCache[Unit] = nil
    end

    for i = 1, 40 do
        local AuraReturn = {g.UnitBuff(Unit, i)}
        local Name, Source = GetSpellInfo(AuraReturn[10]), AuraReturn[7]
        if Name == nil then
            break
        end
        if psy.Tables.AuraCache[Unit] == nil then
            psy.Tables.AuraCache[Unit] = {}
        end
        if psy.Tables.AuraCache[Unit][Name] == nil then
            psy.Tables.AuraCache[Unit][Name] = {
                ["AuraReturn"] = AuraReturn
            }
        end        
        if Source ~= nil and Source == "player" then
            psy.Tables.AuraCache[Unit][Name]["player"] = {
                ["AuraReturn"] = AuraReturn
            }
        end
    end

    for i = 1, 40 do
        local AuraReturn = {g.UnitDebuff(Unit, i)}
        local Name, Source = GetSpellInfo(AuraReturn[10]), AuraReturn[7]
        if Name == nil then
            break
        end
        if psy.Tables.AuraCache[Unit] == nil then
            psy.Tables.AuraCache[Unit] = {}
        end
        if psy.Tables.AuraCache[Unit][Name] == nil then
            psy.Tables.AuraCache[Unit][Name] = {
                ["AuraReturn"] = AuraReturn
            }
        end        
        if Source ~= nil and Source == "player" then
            psy.Tables.AuraCache[Unit][Name]["player"] = {
                ["AuraReturn"] = AuraReturn
            }
        end
    end
end

function AuraCache.Event(...)

	local timeStamp, event, hideCaster, sourceGUID, sourceName, sourceFlags,
          sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = ...

    local dest = p.GetObjectWithGUID(destGUID)
    if dest and (event == "SPELL_AURA_APPLIED" or event == "SPELL_AURA_APPLIED_DOSE" or event == "SPELL_AURA_REMOVED_DOSE" or event == "SPELL_AURA_REFRESH" or event == "SPELL_AURA_REMOVED" or event == "SPELL_PERIODIC_AURA_REMOVED") then
        AuraCache.Refresh(dest)
    end
end

function Buff:Query(Unit, OnlyPlayer)
    OnlyPlayer = OnlyPlayer or false
    Unit = Unit.GUID
    if psy.Tables.AuraCache[Unit] ~= nil and psy.Tables.AuraCache[Unit][self.SpellName] ~= nil and (not OnlyPlayer or psy.Tables.AuraCache[Unit][self.SpellName]["player"] ~= nil) then
        local AuraReturn
        if OnlyPlayer then
            AuraReturn = psy.Tables.AuraCache[Unit][self.SpellName]["player"].AuraReturn
        else
            AuraReturn = psy.Tables.AuraCache[Unit][self.SpellName].AuraReturn
        end
        return unpack(AuraReturn)
    end
    return nil
end

function Debuff:Query(Unit, OnlyPlayer)
    OnlyPlayer = OnlyPlayer or false
    Unit = Unit.GUID
    if psy.Tables.AuraCache[Unit] ~= nil and psy.Tables.AuraCache[Unit][self.SpellName] ~= nil and (not OnlyPlayer or psy.Tables.AuraCache[Unit][self.SpellName]["player"] ~= nil) then
        local AuraReturn
        if OnlyPlayer then
            AuraReturn = psy.Tables.AuraCache[Unit][self.SpellName]["player"].AuraReturn
        else
            AuraReturn = psy.Tables.AuraCache[Unit][self.SpellName].AuraReturn
        end
        return unpack(AuraReturn)
    end
    return nil
end