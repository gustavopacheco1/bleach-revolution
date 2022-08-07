function onSay(cid, words, param)
	param = param:lower()

	if isInArray({ "use", "using" }, param) then
		if getCreatureStorage(cid, "display_use") == 0 then
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_EVENT_ADVANCE,
				"Now you will only receive use messages in the Server Log.",
				"Agora voc� ir� receber mensagens de use apenas no Server Log."
			)
			doCreatureSetStorage(cid, "display_use", 1)
		else
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_EVENT_ADVANCE,
				"Now you will receive the default use messages.",
				"Agora voc� ir� receber as mensagens de use padr�o."
			)
			doCreatureSetStorage(cid, "display_use", nil)
		end
		return true
	end

	if isInArray({ "t�cnica", "t�cnicas", "technique", "techniques", "spell", "spells" }, param) then
		if getCreatureStorage(cid, "display_spell") == 0 then
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_EVENT_ADVANCE,
				"Now you will only receive technique messages in the Server Log.",
				"Agora voc� voc� ir� receber as mensagens de t�cnicas apenas no Server Log."
			)
			doCreatureSetStorage(cid, "display_spell", 1)
		else
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_EVENT_ADVANCE,
				"Now you will receive the default technique messages.",
				"Agora voc� ir� receber mensagens de t�cnicas padr�o."
			)
			doCreatureSetStorage(cid, "display_spell", nil)
		end
		return true
	end

	MultiLanguage.doPlayerPopupFYI(
		cid,
		"Custom Messages System\n\n" ..
		"- Commands\n" ..
		"!show use (Alternate use message)\n" ..
		"!show techniques (Alternate techniques message)",
		"Custom Messages System\n\n" ..
		"- Comandos\n" ..
		"!mostrar use (Alterna mensagem de use)\n" ..
		"!mostrar t�cnicas (Alterna mensage das t�cnicas)"
	)
	return true
end
