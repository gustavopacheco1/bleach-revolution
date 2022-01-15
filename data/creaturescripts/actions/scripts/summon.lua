function onUse(cid, item, frompos, item2, topos)

local storage = 154598
local demon1pos = {x=1009, y=347, z=7}

		if getPlayerStorageValue(cid, storage) >= 1 then
			return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You cannot use this")
			
		end

			doSummonCreature("mizukii", demon1pos)
			setPlayerStorageValue(cid, storage, 1)
		end
	return true
end