function onSay(cid, words, param, channel)
	for _, summon in ipairs(getCreatureSummons(cid)) do
		doTeleportThing(summon, getCreaturePosition(cid))
		doCreatureSay(cid, #getCreatureSummons(cid))
	end
	return true
end
