function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if isInArray( 23, getPlayerVocation(cid)) then
	doSendAnimatedText(getPlayerPosition(cid),"- SHARK -", math.random(1,255))
	doCreatureExecuteTalkAction(cid, "!vemshark", true)
	else
	doCreatureExecuteTalkAction(cid, "!vemshark", true)
end
end