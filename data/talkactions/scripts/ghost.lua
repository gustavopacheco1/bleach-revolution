function onSay(cid, words, param, channel)
	doCreatureExecuteTalkAction(cid, "###invisible")

	if isPlayerGhost(cid) then
		doSetCreatureOutfit(cid, { lookType = 0 }, -1)
	else
		doSetCreatureOutfit(cid, { lookType = 0 }, 0)
	end
	return true
end
