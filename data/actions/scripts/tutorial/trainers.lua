function onUse(cid, item, fromPosition, itemEx, toPosition)
	local tutorial_storage = getCreatureStorage(cid, "tutorial")

	if tutorial_storage < 5 then
		return true
	end

	if tutorial_storage == 5 then
		-- Teleport inside training room
		doTeleportThing(cid, { x = 141, y = 23, z = 7 })

		doCreatureSetStorage(cid, "tutorial", 6)
		registerCreatureEvent(cid, "AdvanceAgilityTutorial")
		doSendTutorialArrow(
			cid,
			{ x = 135, y = 24, z = 7 },
			"tutorial",
			6
		)

		MultiLanguage.doPlayerPopupFYI(
			cid,
			"You can increase your movement speed by training your agility, using the running machines.",
			"Você pode aumentar a sua velocidade treinando sua agilidade, utilizando as esteiras de corrida."
		)
		return true
	end

	if tutorial_storage >= 9 then
		-- Teleport outside training room
		doTeleportThing(cid, { x = 143, y = 23, z = 7 })
		return true
	end
	return true
end
