local _, psy = ...

function psy.findUnlocker()
    local unlocked = false
    if _G.__LB__ then
      unlocked = psy.LBUnlock()
    elseif WowAdUnlock() then
			unlocked = true
		else
			unlocked = false
    end
    return unlocked
end