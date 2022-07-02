local portuguese_parameters = { "br", "pt", "portugu�s", "portugues", "portuguese" }
local english_parameters = { "en", "eng", "ingles", "ingl�s" }

function onSay(cid, words, param, channel)
	if isInArray(portuguese_parameters, param) then
		setPlayerStorageValue(cid, "language", "pt")
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "O idioma do seu jogo foi trocado para o portugu�s.")
	elseif isInArray(english_parameters, param) then
		setPlayerStorageValue(cid, "language", "en")
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Your game language was set to english.")
	else
		if getPlayerStorageValue(cid, "language") == -1 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[PT-BR] Escolha entre ingl�s e portugu�s")
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[EN] Choose between english and portuguese.")
		elseif getPlayerStorageValue(cid, "language") == "pt" then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Escolha entre ingl�s e portugu�s")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Choose between english and portuguese.")
		end
	end

	return true
end
