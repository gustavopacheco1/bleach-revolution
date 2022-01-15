function onSay(cid, words, param, channel)

		if(param == "") then
		doPlayerSendTextMessage(cid, 27, "Command requires param.")
		return TRUE
	end

	if(not getCreatureByName(param)) then
		doPlayerSendTextMessage(cid, 27, "Creature "..param.." not found.")
		return TRUE
	end

	while TRUE do
		doRemoveCreature(getCreatureByName(param))
		if(not getCreatureByName(param)) then
			break
		end
	end
	return doPlayerSendTextMessage(cid, 27, "Creature "..param.." as been removed from map.")
end