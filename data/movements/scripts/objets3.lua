function onStepIn(cid, item, pos)
	doSendAnimatedText(pos, "Grrrr!", 192)
	--doSendMagicEffect(pos, 15)
	return true
end

function onStepOut(cid, item, pos)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Dont Block Me!")
	return true
end