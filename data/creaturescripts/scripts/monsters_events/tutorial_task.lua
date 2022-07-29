function onKill(cid, target, damage, flags)
	local storage_value = getCreatureStorage(cid, "tutorial_task") + 1

	if getCreatureName(target) ~= "Rat" then
		return true
	end

	doCreatureSetStorage(cid, "tutorial_task", storage_value)

	local plural = ""
	if storage_value > 1 then
		plural = "s"
	end

	MultiLanguage.doPlayerSendTextMessage(
		cid,
		MESSAGE_STATUS_CONSOLE_BLUE,
		"You've killed " .. storage_value .. " rat" .. plural .. " of 10.",
		"Você matou " .. storage_value .. " rato" .. plural .. " de 10."
	)

	if storage_value >= 10 then
		MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_STATUS_CONSOLE_BLUE,
			"You've completed the job that Deitan provided to you. Go talk to him.",
			"Você completou o serviço que Deitan forneceu à você. Vá falar com ele."
		)
		unregisterCreatureEvent(cid, "TutorialTask")
	end
	return true
end
