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