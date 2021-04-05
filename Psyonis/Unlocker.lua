local _, psy = ...
local p = psy.Protected
local g = psy.useGUID

function psy.findUnlocker()
    local unlocked = false
    if _G.__LB__ then
        unlocked = psy.LBUnlock()
    else
		if WowAdUnlock() then
			unlocked = true
		else
			unlocked = false
		end
    end
    return unlocked
end