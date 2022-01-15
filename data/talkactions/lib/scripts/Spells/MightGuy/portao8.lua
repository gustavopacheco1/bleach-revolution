local health = -5000
local outfit = {lookType = 937}
local outfit1 = {lookType = 938}

	function onSay(cid, words, param, channel)
	if isInArray( 8, getPlayerVocation(cid)) then
	doSetCreatureOutfit(cid, outfit)
	doChangeSpeed(cid, 30000)
	doCreatureAddHealth(cid, health)
	doCreatureSay(cid, "Eight Gates!", TALKTYPE_MONSTER)
			return true
	end
	
		
	if getPlayerHealth(cid) <= 1000 then
	doSetCreatureOutfit(cid, outfit1)
		return true
	end

	
	if getPlayerLevel(cid) >= 1000 then
	doSetCreatureOutfit(cid, outfit)
		return true
	end
end
