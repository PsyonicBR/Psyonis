local _, psy = ...
psy.Classes = {}
local Classes = psy.Classes
-- Defines class functions.
local function InstanceCallOperator(self, ...)
    return self:Call(...)
end
local function ToStringOperator(self, ...)
    return self:ToString(...)
end
local function UnaryMinusOperator(self, ...)
    return self:UnaryMinus(...)
end
local function AddOperator(self, ...)
    return self:Add(...)
end
local function SubtractOperator(self, ...)
    return self:Subtract(...)
end
local function MultiplyOperator(self, ...)
    return self:Multiply(...)
end
local function DivideOperator(self, ...)
    return self:Divide(...)
end
local function ModuloOperator(self, ...)
    return self:Modulo(...)
end
local function PowerOperator(self, ...)
    return self:Power(...)
end
local function ConcatenateOperator(self, ...)
    return self:Concatenate(...)
end
local function EqualsOperator(self, ...)
    return self:Equals(...)
end
local function LessThanOperator(self, ...)
    return self:LessThan(...)
end
local function LessThanOrEqualToOperator(self, ...)
    return self:LessThanOrEqualTo(...)
end
local function ClassCallOperator(self, ...)
    local Object = {};
    setmetatable(Object, self)
    if Object.Constructor then
        Object:Constructor(...)
    end
    return Object
end

-- Create a new class.
-- @return A table that behaves as a class.
local function Class()
    local Table = {}

    Table.__index = Table
    Table.__call = InstanceCallOperator
    Table.__tostring = ToStringOperator
    Table.__unm = UnaryMinusOperator
    Table.__add = AddOperator
    Table.__sub = SubtractOperator
    Table.__mul = MultiplyOperator
    Table.__div = DivideOperator
    Table.__mod = ModuloOperator
    Table.__pow = PowerOperator
    Table.__concat = ConcatenateOperator
    Table.__eq = EqualsOperator
    Table.__lt = LessThanOperator
    Table.__le = LessThanOrEqualToOperator

    local MetaTable = {}
    MetaTable.__call = ClassCallOperator

    setmetatable(Table, MetaTable)
    return Table
end

Classes.Spell = Class()
Classes.Buff = Class()
Classes.Debuff = Class()
Classes.Unit = Class()
Classes.Player = Class()
Classes.Item = Class()
