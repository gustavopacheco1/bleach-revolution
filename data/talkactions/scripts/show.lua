function onSay(cid, words, param)
	param = param:lower()

	if isInArray({ "use", "using" }, param) then
		if getPlayerStorageValue(cid, "display_use") == 0 then
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_EVENT_ADVANCE,
				"Now you will only receive use messages in the Server Log.",
				"Agora você irá receber mensagens de use apenas no Server Log."
			)
			setPlayerStorageValue(cid, "display_use", 1)
		else
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_EVENT_ADVANCE,
				"Now you will receive the default use messages.",
				"Agora você irá receber as mensagens de use padrão."
			)
			setPlayerStorageValue(cid, "display_use", nil)
		end
	end

	if isInArray({ "técnica", "técnicas", "technique", "techniques", "spell", "spells" }, param) then
		if getPlayerStorageValue(cid, "display_spell") == 0 then
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_EVENT_ADVANCE,
				"Now you will only receive technique messages in the Server Log.",
				"Agora você você irá receber as mensagens de técnicas apenas no Server Log."
			)
			setPlayerStorageValue(cid, "display_spell", 1)
		else
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_EVENT_ADVANCE,
				"Now you will receive the default technique messages.",
				"Agora você irá receber mensagens de técnicas padrão."
			)
			setPlayerStorageValue(cid, "display_spell", nil)
		end
	end
	return true
end
