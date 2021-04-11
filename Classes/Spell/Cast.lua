local _ , psy = ...
local Spell = psy.Classes.Spell
local nUnit = psy.Classes.Unit
local p = psy.Protected

-- Credit to DMW devs for this function https://github.com/fiskee/DoMeWhen/blob/master/Classes/Spell/Cast.lua

function Spell:Cast(Unit)
    if not Unit then
        if self.IsHarmful and psy.Player.Target then
            Unit = nUnit(psy.Player.Target)
        elseif self.IsHelpful then
            Unit = psy.Player
        end
    end
    if self:IsReady() and Unit:GetDistance() <= self.MaxRange then
        p.CastSpellByName(self.SpellName, Unit.GUID)
        self.LastBotTarget = Unit.GUID
        return true
    end
    return false
end