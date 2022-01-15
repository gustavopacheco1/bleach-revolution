function onStepIn(cid, item, pos)

local time = 3

local config = {
[1] = 755,
}

if isMonster(cid) then
	return true
end

if getPlayerLevel(cid) > 1 then
	doSetCreatureOutfit (cid, {lookType = config[getPlayerVocation(cid)]})
	doSendAnimatedText(getPlayerPosition(cid),"Mergulho", math.random(1,69))
	addEvent(Sparzinho, time*1000, pos)
	end

function Sparzinho()
	doCreatureExecuteTalkAction(cid, "!rest", TRUE)
	doCreatureExecuteTalkAction(cid, "!down", TRUE)
	stopEvent(Sparzinho, cid)
end
end

function onStepOut(cid, item, pos)
	doRemoveCondition(cid, CONDITION_OUTFIT)
	doCreatureSetSkullType(cid, 0)
	stopEvent(Sparzinho, cid)
return true
end
