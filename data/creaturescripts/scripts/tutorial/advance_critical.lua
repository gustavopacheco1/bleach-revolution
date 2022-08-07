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
		"Voc� est� pronto!\n\nParab�ns! Voc� deu os primeiros para come�ar sua jornada em Karakura.\nV� at� o sul dessa ilha, Yuuto ir� te ajudar a chegar at� Karakura."
	)

	unregisterCreatureEvent(cid, "AdvanceCriticalTutorial")
	unregisterCreatureEvent(cid, "AttackCriticalTutorial")
	return true
end
