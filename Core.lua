-- Based off the work of BadRotations and DoMeWhen devs

local _, psy = ...
psy.Tables = {}
psy.Constants = {}
psy.Variables = {}
psy.Functions = {}
psy.Rotations = {}
psy.Player = {}
psy.UI = {}
psy.Settings = {}
psy.Pulses = 0
psy.Timers = {
    OM = {},
    Rotation = {}
}
psy.Protected = {}
psy.UseGUID = {}
local Init = false
local DebugStart
local RotationCount = 0

local CreateFrame, UIParent, GetTime, GetSpecialization, GetSpecializationInfo, LibStub, debugprofilestop =
    _G.CreateFrame, _G.UIParent, _G.GetTime, _G.GetSpecialization, _G.GetSpecializationInfo, _G.LibStub,
    _G.debugprofilestop

local function FindRotation()
    if psy.Rotations[psy.Player.Class] and psy.Rotations[psy.Player.Class][psy.Player.Spec] then
        psy.Player.Rotation = psy.Rotations[psy.Player.Class][psy.Player.Spec]
    end
end

local function Initialize()
    psy.Init()
    psy.UI.HUD.Init()
    Init = true
end

local f = CreateFrame("Frame", "Psyonis", UIParent)
f:SetScript("OnUpdate", function()
    psy.Time = GetTime()
    psy.Pulses = psy.Pulses + 1
    if not psy.Constants.Specs[GetSpecializationInfo(GetSpecialization())] then
        return
    end
    if not psy.unlocked then
        psy.findUnlocker()
    end
    if psy.unlocked then
        if not psy.Player.Name then
            psy.Player = psy.Classes.Player(psy.UseGUID.UnitGUID("player"))
        end
        DebugStart = debugprofilestop()
        psy.UpdateOM()
        psy.Timers.OM.Last = debugprofilestop() - DebugStart
        DebugStart = debugprofilestop()
        if not psy.Player.Rotation then
            FindRotation()
        else
            -- if psy.Helpers.Queue.Run() then
            --     return true
            -- end
            if psy.Player.Combat then
                RotationCount = RotationCount + 1
                DebugStart = debugprofilestop()
            end
            psy.Player.Rotation()
            if psy.Player.Combat then
                psy.Timers.Rotation.Last = debugprofilestop() - DebugStart
                psy.Timers.Rotation.Total = psy.Timers.Rotation.Total and
                                                (psy.Timers.Rotation.Total + psy.Timers.Rotation.Last) or
                                                psy.Timers.Rotation.Last
                psy.Timers.Rotation.Average = psy.Timers.Rotation.Total / RotationCount
            end
            -- if not psy.UI.HUD.Loaded then
            --     psy.UI.HUD.Load()
            -- end
        end
        DebugStart = debugprofilestop()
        psy.UI.Debug.Run()
        psy.Timers.OM.Total = psy.Timers.OM.Total and (psy.Timers.OM.Total + psy.Timers.OM.Last) or psy.Timers.OM.Last
        psy.Timers.Rotation.Total =
            psy.Timers.Rotation.Total and (psy.Timers.Rotation.Total + psy.Timers.Rotation.Last) or
                psy.Timers.Rotation.Last or nil
        psy.Timers.OM.Average = psy.Timers.OM.Total / psy.Pulses
    end
end)
