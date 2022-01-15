local outfit = {lookType = 458}
local mana = -10000
local health = -3000

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if not isPlayer(cid) then
		return false
end
	
				
	if isInArray( 23, getPlayerVocation(cid)) then
	doSetCreatureOutfit(cid, outfit)
	doSendAnimatedText(getPlayerPosition(cid),"- SHARK -", math.random(1,69))
	doChangeSpeed(cid, 30000)
	else
	doPlayerAddMana(cid, mana)
	doPlayerSendCancel(cid, "Sorry but there is someone in there! please wait.")
	end
	
	if getPlayerMana(cid) <= 1000 then
	doCreatureAddHealth(cid, health)
	doCreatureSay(cid, "Aaaahh, estou sem chakra!", TALKTYPE_MONSTER)
		return true
	end
end

function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if (isPlayer(cid)) then
	doRemoveCondition(cid, CONDITION_OUTFIT)
	doChangeSpeed(cid, -50)
		return false
	end
end