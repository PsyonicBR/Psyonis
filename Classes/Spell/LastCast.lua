local _, psy = ...
local WaitForSuccess = 0
local lastCastFrame = CreateFrame("Frame")
local Spell = psy.Classes.Spell

function Spell:LastCast(Index)
    Index = Index or 1
    if psy.Player.LastCast and psy.Player.LastCast[Index] then
        return psy.Player.LastCast[Index].SpellName == self.SpellName
    end
    return false
end

local function AddSpell(SpellID)
    if not psy.Player.LastCast then
        psy.Player.LastCast = {}
    end
    for k, v in pairs(psy.Player.Spells) do
        if v.SpellName == GetSpellInfo(SpellID) then
            local Temp = {}
            v.LastCastTime = psy.Time
            Temp.SpellName = v.SpellName
            Temp.CastTime = psy.Time
            tinsert(psy.Player.LastCast, 1, Temp)
            if #psy.Player.LastCast == 10 then
                psy.Player.LastCast[10] = nil
            end
            return true
        end
    end
    return false
end

local function EventTracker(self, event, ...)
    local SourceUnit = select(1, ...)
    local SpellID = select(3, ...)
    if SourceUnit == "player" and EWT and psy.Player.Spells then
        if event == "UNIT_SPELLCAST_START" then
            if AddSpell(SpellID) then
                WaitForSuccess = SpellID
            end
        elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
            if WaitForSuccess == SpellID then
                psy.Player.LastCast[1].SuccessTime = psy.Time
                WaitForSuccess = 0
            else
                if AddSpell(SpellID) then
                    psy.Player.LastCast[1].SuccessTime = psy.Time
                end     
            end
        elseif event == "UNIT_SPELLCAST_STOP" then
            if WaitForSuccess == SpellID then
                tremove(psy.Player.LastCast,1)
                WaitForSuccess = 0
            end
        end
    end
end

lastCastFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
lastCastFrame:RegisterEvent("UNIT_SPELLCAST_STOP")
lastCastFrame:RegisterEvent("UNIT_SPELLCAST_START")
lastCastFrame:SetScript("OnEvent", EventTracker)