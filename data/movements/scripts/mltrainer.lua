function onStepIn(cid, pos, actor)

local parameters = {cid=cid}

local config = {
[1] = 990,
[2] = 988,
[3] = 989,
}

if isMonster(cid) then
	return false
end

if not isPlayer(cid) then
	return false
end

if getPlayerLevel(cid) > 1 then
	doSetCreatureOutfit (cid, {lookType = config[getPlayerVocation(cid)]})
	doSendAnimatedText(getPlayerPosition(cid),"Mergulho", math.random(1,69))
	setPlayerStorageValue(cid, 42892, 1)
	setPlayerStorageValue(cid, 42893, 1)
	parameters = {cid=cid}
	addEvent(Sparzinho, 1000, parameters)
end

function Sparzinho(parameters)
	parameters = {cid=cid}
	doCreatureExecuteTalkAction(parameters.cid, "!rest", true)
	doCreatureExecuteTalkAction(parameters.cid, "!dawn", true)
	addEvent(Sparzinho, time*10000, parameters)
	return true
	end
end

function onStepOut(cid, pos, actor)
	doRemoveCondition(cid, CONDITION_OUTFIT)
	stopEvent(Sparzinho)
	setPlayerStorageValue(cid, 42892, -1)
	setPlayerStorageValue(cid, 42893, -1)
return false
end