local outfit = {lookType = 996}

	function onSay(cid, words, param, channel)
	if isInArray( 8, getPlayerVocation(cid)) then
	doSetCreatureOutfit(cid, outfit)
	doChangeSpeed(cid, 30000)
	doCreatureSay(cid, "One Gates!", TALKTYPE_MONSTER)
			return true
	end
	
	if getPlayerLevel(cid) >= 1000 then
	doSetCreatureOutfit(cid, outfit)
		return true
	end
end
