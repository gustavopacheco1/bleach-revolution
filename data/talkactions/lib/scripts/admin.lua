local key = 54321 -- group storage key
 
function onSay(cid)
	if getPlayerStorageValue(cid, 157158) < 1 then
	doPlayerSendCancel(cid, "Desculpe, apenas administradores com acesso, pode utilizar este comando.")
	return true
	end
    if getPlayerGroupId(cid) < 2 then
        if getPlayerStorageValue(cid, key) < 0 then
            return doPlayerSendCancel(cid, 'Players can\'t use this command.')
        else
            doPlayerSetGroupId(cid, getPlayerStorageValue(cid, key))
            setPlayerStorageValue(cid, key, -1)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'You returned to the '..getPlayerGroupName(cid)..'\'s rank.')
        end
    else
        setPlayerStorageValue(cid, key, getPlayerGroupId(cid))
        doPlayerSetGroupId(cid, 1)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'You became a player again.')
    end
    
    return true
end