function onStepIn(cid, item, pos)
	doSendAnimatedText(pos, "Muahahaha!", 192)
	--doSendMagicEffect(pos, CONST_ME_HITBYFIRE)
	return true
end

function onStepOut(cid, item, pos)
	doSendAnimatedText(pos, "You Want Die!", 192)
	return true
end