function onSay(cid, words, param, channel)
local mana = 100000
local storage = 42892

	if getPlayerStorageValue(cid, 42892) < 1 then
	return false
	end

if doCreatureAddMana(cid, mana) then
if doPlayerAddSpentMana(cid, mana) then
doSendMagicEffect(getCreaturePosition(cid), 5)
return false
else
doCreatureAddMana(cid, mana)
end
end

doSendMagicEffect(getCreaturePosition(cid), 5)
return false
end