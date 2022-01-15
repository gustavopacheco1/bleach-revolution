function onSay(cid, words, param, channel)
local mana = getCreatureMana(cid)
local storage = 42893

	if getPlayerStorageValue(cid, 42893) < 1 then
	return false
	end

if doCreatureAddMana(cid, -mana) then
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