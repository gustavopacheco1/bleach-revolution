-- demon helmet by Alfred

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 15101 then
   		queststatus = getPlayerStorageValue(cid,15101)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found leaft jounin protector.")
   			doPlayerAddItem(cid,7427,1)
   			setPlayerStorageValue(cid,15101,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 15102 then
   		queststatus = getPlayerStorageValue(cid,15102)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found jounin shirt.")
   			doPlayerAddItem(cid,2400,1)
   			setPlayerStorageValue(cid,15102,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 15103 then
   		queststatus = getPlayerStorageValue(cid,15103)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found gaara legs.")
   			doPlayerAddItem(cid,7457,1)
   			setPlayerStorageValue(cid,15103,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 15103 then
   		queststatus = getPlayerStorageValue(cid,15103)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a gaara legs.")
   			doPlayerAddItem(cid,7457,1)
   			setPlayerStorageValue(cid,15103,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end
