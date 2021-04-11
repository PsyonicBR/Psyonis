local _, psy = ...
psy.Classes = {}
local Classes = psy.Classes
-- Defines class functions.
-- call function from http://lua-users.org/wiki/ObjectOrientationTutorial
local function ClassCallOperator(self, ...)
    local Object = setmetatable({}, self)
    Object:New(...)
    return Object
end

-- Create a new class.
-- @return A table that behaves as a class.
local function Class()
    local Table = {}

    Table.__index = Table
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
Classes.ObjectManager = Class()
