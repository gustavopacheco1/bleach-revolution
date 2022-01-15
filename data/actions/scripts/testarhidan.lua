function onUse(cid, item, frompos, item2, topos)
		if not isPlayer(cid) then
		return false
		end
		if getPlayerLevel(cid) > 1 then
		doCreatureSay(cid, "-l NTOUnLiMiTeD l-", TALKTYPE_MONSTER)
	end
end