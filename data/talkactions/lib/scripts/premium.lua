function onSay(cid, words, param)
	if getPlayerStorageValue(cid, 157158) < 1 then
	doPlayerSendCancel(cid, "Desculpe, apenas administradores com acesso, pode utilizar este comando.")
	return true
	end
local tmp = string.explode(param, ",")

local player = getPlayerByName(tmp[1])
local premiumdays = tonumber(tmp[2])

if isPlayer(player) ~= true then
doPlayerSendCancel(cid "Sorry, not possible.")
return false
end
if premiumdays <= 0 or premiumdays == nil then
doPlayerSendCancel(cid, "Please, choose a number of premium days.")
return false
end
doPlayerAddPremiumDays(player, premiumdays)
return true
end