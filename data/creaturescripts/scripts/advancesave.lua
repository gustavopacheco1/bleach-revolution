function onAdvance(cid, skill, oldLevel, newLevel)
	if (skill == SKILL__EXPERIENCE) then
		return true
	end

	doPlayerFormula(cid)

	doPlayerSave(cid, true)
	return true
end
