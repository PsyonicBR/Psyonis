local _ , psy = ...
local Spell = psy.Classes.Spell
local Buff = psy.Classes.Buff
local Debuff = psy.Classes.Debuff
local p = psy.Protected
local g = psy.UseGUID

function Debuff:New(SpellID, BaseDuration)
    self.SpellID = SpellID
    self.SpellName = GetSpellInfo(self.SpellID)
    self.BaseDuration = BaseDuration
end

function Debuff:Exist(Unit, OnlyPlayer)
    OnlyPlayer = OnlyPlayer or false
    Unit = Unit or psy.Player
    return self:Query(Unit, OnlyPlayer) ~= nil
end

function Debuff:Remain(Unit, OnlyPlayer)
    OnlyPlayer = OnlyPlayer or false
    Unit = Unit or psy.Player
    local EndTime = select(6, self:Query(Unit, OnlyPlayer))
    if EndTime then
        if EndTime == 0 then
            return 999
        end
        return (EndTime - psy.Time)
    end
    return 0
end