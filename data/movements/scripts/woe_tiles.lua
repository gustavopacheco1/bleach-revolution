dofile("./_woe.lua")

function onStepIn(cid, item, position, fromPosition)
	if item.actionid == Castle.tiles then
		Woe.getInfo()
		if isPlayer(cid) then
			if Woe.isTime() then
				if getPlayerGuildId(cid) ~= 0 then
					if Woe.isRegistered(cid) then
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Good Luck ".. getCreatureName(cid) .."!.")
					else
						Woe.moveBack(cid, fromPosition, "you are not registered use !guild")
					end			
				else
					Woe.moveBack(cid, fromPosition, "only players with guild can enter.")
				end
			elseif getPlayerGuildId(cid) == infoLua[2] then
				if Woe.isRegistered(cid) then
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "wellcome ".. getCreatureName(cid) ..".")
				else
					Woe.moveBack(cid, fromPosition, "you are not registered use !guild")
				end			
			else
				Woe.moveBack(cid, fromPosition, "its not woe time and you are not member of ".. Woe.guildName() ..".")
			end
		end
	elseif item.actionid == Castle.portals then
		doTeleportThing(cid, Castle.PreToPos[math.random(1, 2)], false)
	elseif item.actionid == Castle.bases then
		if isPlayer(cid) then
			Woe.moveBack(cid, fromPosition, "you cant step there.")
		end
	end
	return true
end

function onAddItem(moveitem, tileitem, position)
	doRemoveItem(moveitem.uid, moveitem.type > 0 and moveitem.type or 1)
	return true
end
