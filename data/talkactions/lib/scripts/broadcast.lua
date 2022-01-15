function onSay(cid, words, param, channel)
	if getPlayerStorageValue(cid, 157158) < 1 then
	doPlayerSendCancel(cid, "Desculpe, apenas administradores com acesso, pode utilizar este comando.")
	return true
	end
	if(param == '') then
		return true
	end

	doPlayerBroadcastMessage(cid, param)
	return true
end
