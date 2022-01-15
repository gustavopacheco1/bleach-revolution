function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.uid > 1000 and item.uid < 13000 then
		local itemWeight = getItemWeightById(item.uid, 1)
		local playerCap = getPlayerFreeCap(cid)
		if getPlayerStorageValue(cid, item.uid) == -1 then
			if playerCap >= itemWeight then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a ' .. getItemNameById(item.uid) .. '.')
				doPlayerAddItem(cid, item.uid ,1)
				setPlayerStorageValue(cid, item.uid, 1)
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a ' .. getItemNameById(item.uid) .. ' weighing ' .. itemWeight .. ' oz it\'s too heavy.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
		end
	else
		return false
	end
	return true
end