function onSay(cid, words, param, channel)
	-- doCreatureAddHealth(cid, -getCreatureMaxHealth(cid) + 1)
	-- doCreatureAddHealth(cid, getCreatureMaxHealth(cid))

	table.print(getPlayerInstantSpellInfo(cid, 1))
	return true
end
