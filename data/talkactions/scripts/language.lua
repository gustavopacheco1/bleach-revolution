local portuguese_parameters = { "br", "pt", "portugu�s", "portugues", "portuguese" }
local english_parameters = { "en", "eng", "ingles", "ingl�s" }

function onSay(cid, words, param, channel)
	if isInArray(portuguese_parameters, param) then
		doCreatureSetStorage(cid, "language", "pt")
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "O idioma do seu jogo foi trocado para o portugu�s.")
		return true
	end

	if isInArray(english_parameters, param) then
		doCreatureSetStorage(cid, "language", "en")
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Your game language was set to english.")
		return true
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[PT-BR] Escolha entre ingl�s e portugu�s")
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[EN] Choose between english and portuguese.")
	return true
end
