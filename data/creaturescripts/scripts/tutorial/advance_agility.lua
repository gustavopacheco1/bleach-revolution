function onAdvance(cid, skill, oldLevel, newLevel)
	if skill ~= SKILL_FISHING then
		return true
	end

	doCreatureSetStorage(cid, "tutorial", 7)
	doSendTutorialArrow(
		cid,
		{ x = 138, y = 21, z = 7 },
		"tutorial",
		7
	)
	unregisterCreatureEvent(cid, "AdvanceAgilityTutorial")
	return true
end
