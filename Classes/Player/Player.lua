local _ , psy = ...
local Player = psy.Classes.Player
local Spell = psy.Classes.Spell
local Buff = psy.Classes.Buff
local Debuff = psy.Classes.Debuff
local Unit = psy.Classes.Unit
local p = psy.Protected
local g = psy.UseGUID

local specFrame = CreateFrame("Frame")
local levelFrame = CreateFrame("Frame")


function Player:New(GUID)
    -- set properties that don't change
    self.GUID = GUID
    self.Name = g.UnitName(GUID)
    self.Class = select(2, g.UnitClass(GUID))
    self.CombatReach = p.UnitCombatReach(GUID)
    self.Height = 2
    self.Distance = 0
    -- set placeholder for properties that need to be updated as they change
    self.SpecID = GetSpecializationInfo(GetSpecialization())
    self.Spec = psy.Constants.Specs[self.SpecID] or ""
    self.Level = g.UnitLevel(GUID)
    self:GetSpells()
end

function Player:Update()
    self.X, self.Y, self.Z = p.ObjectPosition(self.GUID)
    self.Health = g.UnitHealth(self.GUID)
    self.HealthMax = g.UnitHealthMax(self.GUID)
    self.HealthPct = self.Health / self.HealthMax * 100
    self.Power = g.UnitPower(self.GUID)
    self.PowerMax = g.UnitPowerMax(self.GUID)
    self.PowerPct = self.Power / self.PowerMax * 100
    self.Instance = select(2, IsInInstance())
    self.Casting = g.UnitCastingInfo(self.GUID) or g.UnitChannelInfo(self.GUID)
    self.Combat = g.UnitAffectingCombat(self.GUID)
    self.Moving = g.GetUnitSpeed(self.GUID) > 0
    self.PowerRegen = GetPowerRegen()
end

function Player:GetDistance()
    return self.Distance
end

function Player:SetSpecialization()
    self.SpecID = GetSpecializationInfo(GetSpecialization())
    self.Spec = psy.Constants.Specs[self.SpecID] or ""
end

function Player:SetLevel(level)
    self.Level = level
end

local function SetPlayerSpecialization(self, event, ...)
    local unit = select(1, ...)
    if unit == "player" then
        return Player:SetSpecialization()
    end
end

local function SetPlayerLevel(self, event, ...)
    local level = select(1, ...)
    return Player:SetLevel(level)
end

function Player:GCD()
    if psy.Constants.GCDOneSec[self.SpecID] then
        return 1
    else
        return math.max(1.5 / (1 + GetHaste() / 100), 0.75)
    end
end

function Player:GetSpells()
    local CastType
    self.Spells = {}
    self.Buffs = {}
    self.Debuffs = {}
    for k,v in pairs(psy.Constants.Spells) do
        if k == "GLOBAL" or k == self.Class then
            for Spec, SpecTable in pairs(v) do
                if Spec == "All" or Spec == self.Spec then
                    for SpellType, SpellTable in pairs(SpecTable) do
                        if SpellType == "Abilities" then
                            for SpellName,SpellInfo in pairs(SpellTable) do
                                CastType = SpellInfo.CastType or "Normal" 
                                self.Spells[SpellName] = Spell(SpellInfo.SpellID, CastType)
                            end
                        end
                        if SpellType == "Buffs" then
                            for SpellName,SpellID in pairs(SpellTable) do
                                self.Buffs[SpellName] = Buff(SpellID)
                            end
                        end
                        if SpellType == "Debuffs" then
                            for SpellName,SpellID in pairs(SpellTable) do
                                self.Debuffs[SpellName] = Debuff(SpellID)
                            end
                        end
                    end
                end
            end       
        end        
    end
end

levelFrame:RegisterEvent("PLAYER_LEVEL_UP")
levelFrame:SetScript("OnEvent", SetPlayerLevel)
specFrame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
specFrame:SetScript("OnEvent", SetPlayerSpecialization)


