function onLogin(cid)
	-- Magic Level Rates
	if (isInArray({1, 2, 5, 6}, getPlayerVocation(cid)) == TRUE) then
		if (getPlayerMagLevel(cid, true) >= 100) then
			return doPlayerSetRate(cid, SKILL__MAGLEVEL, 5.0)
		elseif (getPlayerMagLevel(cid, true) >= 90) then
			return doPlayerSetRate(cid, SKILL__MAGLEVEL, 10.0)
		elseif (getPlayerMagLevel(cid, true) >= 80) then
			return doPlayerSetRate(cid, SKILL__MAGLEVEL, 20.0)
		elseif (getPlayerMagLevel(cid, true) >= 50) then
			return doPlayerSetRate(cid, SKILL__MAGLEVEL, 30.0)
		elseif (getPlayerMagLevel(cid, true) >= 30) then
			return doPlayerSetRate(cid, SKILL__MAGLEVEL, 40.0)
		elseif (getPlayerMagLevel(cid, true) < 30) then
			return doPlayerSetRate(cid, SKILL__MAGLEVEL, 50.0)
		end
		return true
	elseif (isInArray({7, 8}, getPlayerVocation(cid)) == TRUE) then
		return doPlayerSetRate(cid, SKILL__MAGLEVEL, 7.0)
	end
	return true
end