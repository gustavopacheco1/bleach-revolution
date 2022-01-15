function onThink(cid)
	local target = getCreatureTarget(cid)
	if(target ~= 0 and not isPlayer(target)) then
		doRemoveCreature(target)
	end
	return true
end