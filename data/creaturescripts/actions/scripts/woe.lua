dofile("./_woe.lua")

local delays = 60

local guards_price = 30000	--30k

function onUse(cid, item, fromPosition, itemEx, toPosition)
	Woe.getInfo()
	if item.actionid == Castle.banderas then
		if Woe.isTime() then
			if Woe.isStarted() then
				if infoLua[2] == getPlayerGuildId(cid) then
					doTeleportThing(cid, Castle.guildEntry, false)
				else
					doPlayerSendCancel(cid, "You are not member of ".. Woe.guildName() ..".")
				end
			end
		else
			if infoLua[2] == getPlayerGuildId(cid) then
				doTeleportThing(cid, Castle.guildEntry, false)
			else
				doPlayerSendCancel(cid, "You are not member of ".. Woe.guildName() ..".")
			end
		end
	elseif (item.uid == 3134) then
		if not Woe.isStarted() or (infoLua[2] ~= getPlayerGuildId(cid)) or (getPlayerGuildLevel(cid) ~= GUILDLEVEL_LEADER) then
			return true
		end
		if (getPlayerMoney(cid) < guards_price) then
			return doPlayerSendCancel(cid, "Not enough money.")
		end
		local varDelay = getGlobalStorageValue(24503)
		if (varDelay < 0) or ((os.time() - varDelay) >= delays) then
			if Woe.check() then
				Woe.summon()
				doPlayerRemoveMoney(cid, guards_price)
			else
				doPlayerSendCancel(cid, "There are still guards alive.")
			end
		else
			doPlayerSendCancel(cid, "Delay no listo.")
		end
	end
	return true
end 
