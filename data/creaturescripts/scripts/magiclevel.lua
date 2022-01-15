function onAdvance(cid)
	if(getPlayerMagLevel(cid) >= 120) then
		doPlayerSetMagicRate(cid, 0)
	end
	return TRUE
end