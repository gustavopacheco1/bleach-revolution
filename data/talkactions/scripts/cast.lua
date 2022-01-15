function onSay(cid, words, param, channel)
	local tmp = param:explode(" ")
	if not(tmp[1]) then
		return doPlayerSendCancel(cid, "Parameters needed")
	end
	
	if tmp[1] == "on" then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cast has started.")
		doPlayerSetCastState(cid, true)
		doPlayerSave(cid)
	elseif getPlayerCast(cid).status == false then
		return doPlayerSendCancel(cid, "Your cast has to be running for this action.")
	elseif tmp[1] == "off" then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cast has ended.")
		doPlayerSetCastState(cid, false)
				doPlayerSave(cid)
	elseif isInArray({"pass", "password", "p"}, tmp[1]) then
		if not(tmp[2]) then
			return doPlayerSendCancel(cid, "You need to set a password")
		end
		
		if tmp[2]:len() > 10 then
			return doPlayerSendCancel(cid, "The password is too long. (Max.: 10 letters)")
		end
		
		if tmp[2] == "off" then
			doPlayerSetCastPassword(cid, "")
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cast password has been removed.")
		else
			doPlayerSetCastPassword(cid, tmp[2])
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cast password was set to: " .. tmp[2])
		end
	elseif param == "status" then
		local t, c = getCastViewers(cid), getPlayerCast(cid)
		local count = 0
		for _,v in pairs(t) do count = count + 1 end
		
		doShowTextDialog(cid, 5958, "Cast Status:\n\n*Viewers:\n      " .. count .. "\n*Description:\n      "..(c.description == "" and "Not set" or c.description).."\n*Password:\n      " .. (c.password == "" and "Not set" or "Set - '"..c.password.."'"))
	elseif param == "update" then
		if getPlayerStorageValue(cid, 656544) > os.time() then
			return doPlayerSendCancel(cid, "You used this command lately. Wait: " .. (getPlayerStorageValue(cid, 656544)-os.time()) .. " sec.")
		end
		doPlayerSave(cid)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "The cast settings have been updated.")
		doPlayerSetStorageValue(cid, 656544, os.time()+60)
	end
	return true
end
