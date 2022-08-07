function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getCreatureStorage(cid, "tutorial") ~= 7 then
		return true
	end

	doPlayerAddItem(cid, 16456, 1)

	MultiLanguage.doPlayerPopupFYI(
		cid,
		"You've received a wooden sword.\n\nYou can use this weapon to train your critical skills.",
		"Você recebeu uma wooden sword.\n\nVocê pode utilizar essa arma para treinar suas habilidades de critical."
	)

	doCreatureSetStorage(cid, "tutorial", 8)
	doSendTutorialArrow(
		cid,
		{ x = 139, y = 28, z = 7 },
		"tutorial",
		8
	)

	registerCreatureEvent(cid, "AdvanceCriticalTutorial")
	registerCreatureEvent(cid, "AttackCriticalTutorial")
	return true
end
