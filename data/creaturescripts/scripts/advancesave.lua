local config = {
	healPlayerOnLevel = true
}

function onAdvance(cid, skill, oldLevel, newLevel)
	if (skill == SKILL__EXPERIENCE) then
		return true
	end

	if (skill == SKILL__LEVEL and config.healPlayerOnLevel) then
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
		doCreatureAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid))
	end

	doPlayerSave(cid, true)
	return true
end
