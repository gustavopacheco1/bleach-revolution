local config = {4820,4822,4821,4824,4823,4825}

local i = config

function onLogin(cid)
	if isInArray( 23, getPlayerVocation(cid)) and getTileItemById(getPlayerPosition(cid), 4820) then
	doSendAnimatedText(getPlayerPosition(cid),"- SHARK -", math.random(1,255))
	doCreatureExecuteTalkAction(cid, "!vemshark", true)
end
end