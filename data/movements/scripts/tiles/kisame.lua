local outfit = {lookType = 458}
local mana = -10000
local health = -3000

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if not isPlayer(cid) then
	return false
	end
				
	if isInArray( 23, getPlayerVocation(cid)) then
	doCreatureExecuteTalkAction(cid, "!vemshark", 5000, true)
	doSetCreatureOutfit(cid, outfit)
	doChangeSpeed(cid, 30000)
	else
	doPlayerAddMana(cid, mana)
	end
	
	if getPlayerMana(cid) <= 1000 then
	doCreatureAddHealth(cid, health)
	doCreatureSay(cid, "Aaaahh, estou sem chakra!", TALKTYPE_MONSTER)
		return true
	end
end

function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if not isPlayer(cid) then
	return false
	end
	if isInArray( 23, getPlayerVocation(cid)) then
	doRemoveCondition(cid, CONDITION_OUTFIT)
	doCreatureExecuteTalkAction(cid, "!saishark", 5000, true)
		return false
	end
end