local time = 1 -- tempo em segundos que o item vai ficar na posição.

function restin(cid, pos)
doCreatureExecuteTalkAction(parameters.cid, "!down", TRUE)
doSendMagiceffectin(getCreaturePosition(cid), 210)
end

function downzin(cid, pos)
doCreatureExecuteTalkAction(parameters.cid, "!rest", TRUE)
doSendMagiceffectin(getCreaturePosition(cid), 210)
return true
end

function onStepIn(cid, item, position, fromPosition)
	parameters = {cid=cid}
	doCreatureExecuteTalkAction(cid, "!rest", TRUE)
	doCreatureExecuteTalkAction(cid, "!down", TRUE)
	doSendMagicEffect(getCreaturePosition(cid), 210)
	addEvent(downzin, time*1000, cid)
	addEvent(restin, time*1000, cid)
    return true
end

