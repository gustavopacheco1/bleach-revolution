function onSay(cid, words, param)
	param = param:lower()

	if isInArray({ "use", "using" }, param) then
		if getPlayerStorageValue(cid, "display_use") == 0 then
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_EVENT_ADVANCE,
				"Now you will only receive use messages in the Server Log.",
				"Agora voc� ir� receber mensagens de use apenas no Server Log."
			)
			setPlayerStorageValue(cid, "display_use", 1)
		else
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_EVENT_ADVANCE,
				"Now you will receive the default use messages.",
				"Agora voc� ir� receber as mensagens de use padr�o."
			)
			setPlayerStorageValue(cid, "display_use", nil)
		end
	end

	if isInArray({ "t�cnica", "t�cnicas", "technique", "techniques", "spell", "spells" }, param) then
		if getPlayerStorageValue(cid, "display_spell") == 0 then
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_EVENT_ADVANCE,
				"Now you will only receive technique messages in the Server Log.",
				"Agora voc� voc� ir� receber as mensagens de t�cnicas apenas no Server Log."
			)
			setPlayerStorageValue(cid, "display_spell", 1)
		else
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_EVENT_ADVANCE,
				"Now you will receive the default technique messages.",
				"Agora voc� ir� receber mensagens de t�cnicas padr�o."
			)
			setPlayerStorageValue(cid, "display_spell", nil)
		end
	end
	return true
end
