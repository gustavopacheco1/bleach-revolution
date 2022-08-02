function onKill(cid, target, damage, flags)
	if getCreatureName(target) ~= "Rat" then
		return true
	end

	local storage_value = getCreatureStorage(cid, "tutorial_task") + 1

	if storage_value == 1 then
		MultiLanguage.doPlayerPopupFYI(
			cid,
			"Congratulations! You've killed your first creature.\n\n" ..
			"While hunting it's extremely recommended to use !autoloot to loot the creature corpses.\n" ..
			"When killing a creature, you are going to receive a message in the Loot channel, informing what is in that creature's corpse."
			,
			"Parabéns! Você matou a sua primeira criatura.\n\n" ..
			"Quando estiver caçando, é extremamente recomendado que você utilize !autoloot para saquear o corpo das criaturas.\n"
			..
			'Ao eliminar uma criatura, você irá receber uma mensagem no canal "Loot" informando o que tem no corpo dessa criatura.'
		)
	end

	if storage_value == 6 then
		MultiLanguage.doPlayerPopupFYI(
			cid,
			"Custom Messages System\n\n" ..
			"You can use !show to custom some messages you receive, so you can make your game look cleaner.",
			"Custom Messages System\n\n" ..
			"Você pode utilizar !mostrar para customizar algumas mensagens, assim fazendo o seu jogo parecer mais limpo."
		)
	end

	doCreatureSetStorage(cid, "tutorial_task", storage_value)

	local plural = ""
	if storage_value > 1 then
		plural = "s"
	end

	MultiLanguage.doPlayerSendTextMessage(
		cid,
		MESSAGE_STATUS_CONSOLE_BLUE,
		"Daitan: You've killed " .. storage_value .. " rat" .. plural .. " of 10.",
		"Daitan: Você matou " .. storage_value .. " rato" .. plural .. " de 10."
	)

	if storage_value >= 10 then
		MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_STATUS_CONSOLE_BLUE,
			"You've completed the job that Daitan provided to you. Go talk to him.",
			"Você completou o serviço que Daitan forneceu a você. Vá falar com ele."
		)
		unregisterCreatureEvent(cid, "TutorialTask")
	end
	return true
end
