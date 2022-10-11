function onLogin(cid)
	if isPremium(cid) then
		doPlayerSetRate(cid, SKILL__LEVEL, 1.1)
	else
		doPlayerSetRate(cid, SKILL__LEVEL, 1)
	end
	return true
end
