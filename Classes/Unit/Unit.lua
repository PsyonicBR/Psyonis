local _ , psy = ...
local Unit = psy.Classes.Unit
local p = psy.Protected
local g = psy.UseGUID


function Unit:New(GUID)
    -- set properties that don't change
    self.GUID = GUID
    self.Name = g.UnitName(GUID)
    self.CombatReach = p.UnitCombatReach(GUID)
    self.Player = g.UnitIsPlayer(GUID)
    self.ObjectID = p.ObjectID(GUID)
    self.HealthMax = g.UnitHealthMax(GUID)
    if self.Player then
        self.Height = 2
    elseif p.GetHeight ~= nil then
        self.Height = p.GetHeight(GUID)
    else
        self.Height = 2
    end
    psy.Functions.AuraCache.Refresh(GUID)
    -- set placeholder for properties that need to be updated as they change
    self.X, self.Y, self.Z = nil, nil, nil
    self.Distance = nil
    self.RawDistance = nil
    self.LineOfSight = nil
    self.Attackable = nil
    self.IsBoss = nil
    self.IsTarget = nil
    self.HasThreat = nil
    self.Health = nil
    self.HealthPercent = nil
    self.Dead = nil
    -- print("New unit created with ", GUID)
end

function Unit:GetPosition()
    if self.X == nil then
        self.X, self.Y, self.Z = p.ObjectPosition(self.GUID)
    end
    return self.X, self.Y, self.Z
end

function Unit:GetDistance(OtherUnit)
    -- return distance between unit and player if no arg and distance already calculated this frame
    if OtherUnit == nil and self.Distance ~= nil then
        return self.Distance
    end
    OtherUnit = OtherUnit or psy.Player
    if not self.X then
        self.X, self.Y, self.Z = self:GetPosition()
    end
    if not OtherUnit.X then
        OtherUnit.X, OtherUnit.Y, OtherUnit.Z = OtherUnit:GetPosition()
    end
    if not self.X or not OtherUnit.X then
        return math.huge
    end
    local distance = math.sqrt(((self.X - OtherUnit.X) ^ 2) + ((self.Y - OtherUnit.Y) ^ 2) + ((self.Z - OtherUnit.Z) ^ 2)) - ((self.CombatReach or 0) + (OtherUnit.CombatReach or 0))
    if OtherUnit == psy.Player then
        self.Distance = distance
    end
    return distance
end

function Unit:GetRawDistance(OtherUnit)
    -- return distance between unit and player if no arg and distance already calculated this frame
    if OtherUnit == nil and self.RawDistance ~= nil then
        return self.RawDistance
    end
    OtherUnit = OtherUnit or psy.Player
    if not self.X then
        self.X, self.Y, self.Z = self:GetPosition()
    end
    if not OtherUnit.X then
        OtherUnit.X, OtherUnit.Y, OtherUnit.Z = OtherUnit:GetPosition()
    end
    if not self.X or not OtherUnit.X then
        return math.huge
    end
    local distance = math.sqrt(((self.PosX - OtherUnit.PosX) ^ 2) + ((self.PosY - OtherUnit.PosY) ^ 2) + ((self.PosZ - OtherUnit.PosZ) ^ 2))
    if OtherUnit == psy.Player then
        self.RawDistance = distance
    end
    return distance
end

function Unit:GetLineOfSight()
    if psy.Constants.IgnoreLoS[self.ObjectID] then
        return true
    end
    if self.LineOfSight ~= nil then
        return self.LineOfSight
    end
    local OtherUnit = psy.Player
    if OtherUnit.X == nil then
        OtherUnit.X, OtherUnit.Y, OtherUnit.Z = OtherUnit:GetPosition()
    end
    if not self.X then
        self.X, self.Y, self.Z = self:GetPosition()
    end
    if not self.X or not OtherUnit.X then
        return math.huge
    end
    local LoS = p.TraceLine(self.X, self.Y, self.Z + self.Height, OtherUnit.X, OtherUnit.Y, OtherUnit.Z + OtherUnit.Height, 0x100010) == nil
    self.LineOfSight = LoS
    return LoS
end

function Unit:IsAttackable()
    if self.Attackable == nil then
        self.Attackable = self:GetLineOfSight() and g.UnitCanAttack("player",self.GUID) or false
    end
    return self.Attackable
end

function Unit:IsBoss()
    if self.IsBoss == nil then
        local Classification = g.UnitClassification(self.GUID)
        self.IsBoss = Classification == "worldboss" or Classification == "rareelite"
    end
    return self.IsBoss
end

function Unit:IsTarget()
    if self.IsTarget == nil then
        self.IsTarget = g.UnitIsUnit(self.GUID, "target")
    end
    return self.IsTarget
end

function Unit:HasThreat()
    if self.HasThreat ~= nil then
        return self.HasThreat
    end
    if psy.Constants.IgnoreThreat[self.ObjectID] and self:IsTarget() then
        self.HasThreat = true
    elseif psy.Constants.EnemyBlacklist[self.ObjectID] then
        self.HasThreat = false
    elseif psy.Player:InInstance() and (g.UnitAffectingCombat(self.GUID) or (self:IsTarget() and GetNumGroupMembers() <= 1))  then
        self.HasThreat = true
    elseif not psy.Player:InInstance() and (psy.Constants.Dummies[self.ObjectID] or self:IsTarget()) then
        self.HasThreat = true
    else
        self.HasThreat = false
    end
    return self.HasThreat
end

function Unit:GetHealth()
    if self.Health == nil or self.HealthPercent == nil then
        self.Health = g.UnitHealth(self.GUID)
        self.HealthPercent = self.Health / self.HealthMax * 100
    end
    return self.Health, self.HealthPercent
end

function Unit:IsDead()
    if self.Dead == nil then
        self.Dead = g.UnitIsDeadOrGhost(self.GUID)
    end
    return self.Dead
end

