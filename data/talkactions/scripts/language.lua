local portuguese_parameters = { "br", "pt", "português", "portugues", "portuguese" }
local english_parameters = { "en", "eng", "ingles", "inglês" }

function onSay(cid, words, param, channel)
	if isInArray(portuguese_parameters, param) then
		setPlayerStorageValue(cid, "language", "pt")
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "O idioma do seu jogo foi trocado para o português.")
	elseif isInArray(english_parameters, param) then
		setPlayerStorageValue(cid, "language", "en")
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Your game language was set to english.")
	else
		if getPlayerStorageValue(cid, "language") == -1 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[PT-BR] Escolha entre inglês e português")
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[EN] Choose between english and portuguese.")
		elseif getPlayerStorageValue(cid, "language") == "pt" then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Escolha entre inglês e português")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Choose between english and portuguese.")
		end
	end

	return true
end
