function onStepIn(cid, item, pos)
	doSendAnimatedText(pos, "Chosfffs", 192)
	--doSendMagicEffect(pos, CONST_ME_HITBYFIRE)
	return true
end

function onStepOut(cid, item, pos)
	doSendAnimatedText(pos, "grrrkk", 192)
	return true
end