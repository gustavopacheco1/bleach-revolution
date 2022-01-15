dofile("./_woe.lua")

function onSay(cid, words, param)
	if not Woe.isRegistered(cid) then
		if getPlayerGuildId(cid) > 0 then
			setPlayerStorageValue(cid, stor.register, 1)
		else
			doPlayerSendCancel(cid, "no guild.")
		end
	else
		doPlayerSendCancel(cid, "already registered.")
	end
	return true
end
