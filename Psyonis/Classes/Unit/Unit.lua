local _ , psy = ...
local Unit = psy.Classes.Unit
local p = psy.Protected
local g = psy.useGUID


function Unit:New(GUID)
    -- set properties that don't change
    self.GUID = GUID
    self.Name = g.UnitName(GUID)
    self.CombatReach = p.UnitCombatReach(GUID)
    self.Player = g.UnitIsPlayer(GUID)
    self.ObjectID = p.ObjectID(GUID)
    if self.Player then
        self.Height = 2
    elseif p.GetHeight ~= nil then
        self.Height = p.GetHeight(GUID)
    else
        self.Height = 2
    end
    -- set placeholder for properties that need to be updated as they change
    self.X, self.Y, self.Z = nil, nil, nil
    self.Distance = nil
    self.RawDistance = nil
    self.LineOfSight = nil
    self.Attackable = nil
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
    local distance = math.sqrt(((self.PosX - OtherUnit.PosX) ^ 2) + ((self.PosY - OtherUnit.PosY) ^ 2) + ((self.PosZ - OtherUnit.PosZ) ^ 2)) - ((self.CombatReach or 0) + (OtherUnit.CombatReach or 0))
    if OtherUnit == psy.Player then
        self.Distance = distance
    end
    return distance
end

function Unit:RawDistance(OtherUnit)
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
    local LoS = p.TraceLine(self.PosX, self.PosY, self.PosZ + self.Height, OtherUnit.PosX, OtherUnit.PosY, OtherUnit.PosZ + OtherUnit.Height, 0x100010) == nil
    self.LineOfSight = LoS
    return LoS
end

function Unit:Attackable()
    if self.Attackable == nil then
        self.Attackable = self:GetLineOfSight() and g.UnitCanAttack("player",self.GUID) or false
    end
    return self.Attackable
end
