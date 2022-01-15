local savingEvent = 0

function onSay(cid, words, param, channel)
	if getPlayerStorageValue(cid, 157158) < 1 then
	doPlayerSendCancel(cid, "Desculpe, apenas administradores com acesso, pode utilizar este comando.")
	return true
	end
	local tmp = tonumber(param)
	if(tmp ~= nil) then
		stopEvent(savingEvent)
		save(tmp * 60 * 1000)
	elseif(param == '') then
		doSaveServer()
	else
		local tid = getPlayerByNameWildcard(param)
		if(not tid or (isPlayerGhost(tid) and getPlayerGhostAccess(tid) > getPlayerGhostAccess(cid))) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not found.")
		else
			doPlayerSave(tid)
		end
	end

	return true
end

function save(delay)
	doSaveServer()
	if(delay > 0) then
		savingEvent = addEvent(save, delay, delay)
	end
end
