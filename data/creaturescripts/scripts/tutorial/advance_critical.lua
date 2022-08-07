function onAdvance(cid, skill, oldLevel, newLevel)
	if skill ~= SKILL_CLUB then
		return true
	end

	doCreatureSetStorage(cid, "tutorial", 9)
	doSendTutorialArrow(
		cid,
		{ x = 154, y = 51, z = 7 },
		"tutorial",
		9
	)

	MultiLanguage.doPlayerPopupFYI(
		cid,
		"You are ready!\n\nCongratulations! You took the first steps start your journey in Karakura.\nGo to the south of this island, Yuuto is going to help you to get to Karakura.",
		"Você está pronto!\n\nParabéns! Você deu os primeiros para começar sua jornada em Karakura.\nVá até o sul dessa ilha, Yuuto irá te ajudar a chegar até Karakura."
	)

	unregisterCreatureEvent(cid, "AdvanceCriticalTutorial")
	unregisterCreatureEvent(cid, "AttackCriticalTutorial")
	return true
end
