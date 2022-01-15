function onAdvance(cid, skill, oldLevel, newLevel)
	if skill == SKILL__MAGLEVEL then
		if (isInArray({1, 2, 5, 6}, getPlayerVocation(cid)) == TRUE) then
			if (newLevel >= 100) then
				return doPlayerSetRate(cid, SKILL__MAGLEVEL, 20.0)
			elseif (newLevel >= 90) then
				return doPlayerSetRate(cid, SKILL__MAGLEVEL, 30.0)
			elseif (newLevel >= 80) then
				return doPlayerSetRate(cid, SKILL__MAGLEVEL, 40.0)
			elseif (newLevel >= 50) then
				return doPlayerSetRate(cid, SKILL__MAGLEVEL, 50.0)
			elseif (newLevel >= 30) then
				return doPlayerSetRate(cid, SKILL__MAGLEVEL, 100.0)
			end
			return true
		end
		return true
	end
	return true
end
