function onSay(cid, words, param, channel)
	if getPlayerStorageValue(cid, 157158) < 1 then
	doPlayerSendCancel(cid, "Desculpe, apenas administradores com acesso, pode utilizar este comando.")
	return true
	end
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param.")
		return true
	end

	local t, pid = string.explode(param, ","), cid
	if(t[2]) then
		pid = getPlayerByNameWildcard(t[2])
		if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. t[2] .. " not found.")
			return true
		end
	end

	local period, tmp = -1, tonumber(t[3])
	if(t[3] and tmp) then
		period = tmp
	end

	if(not isNumeric(t[1])) then
		if(getMonsterInfo(t[1])) then
			doSetMonsterOutfit(pid, t[1], period)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Such outfit does not exist.")
		end

		return true
	end

	t[1] = tonumber(t[1])
	if(t[1] <= 1 or t[1] == 135 or (t[1] > 1150 and t[1] < 1992) or (t[1] > 3051 and t[1] < 3066) or t[1] > 1500) then
		local item = getItemInfo(t[1])
		if(item) then
			doSetItemOutfit(pid, t[1], period)
			return true
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Such outfit does not exist.")
		return true
	end

	local tmp = getCreatureOutfit(pid)
	tmp.lookType = t[1]

	doCreatureChangeOutfit(pid, tmp)
	return true
end
