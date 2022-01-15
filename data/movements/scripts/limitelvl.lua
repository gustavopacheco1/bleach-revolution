function onStepIn(cid, item, position, fromPosition)
	if getPlayerLevel(cid) >= 150 and getPlayerLevel(cid) <= 999 then
		return true
	end
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Somente player lvl 150 podem passar.")
	doTeleportThing(cid, fromPosition)
	return true
end