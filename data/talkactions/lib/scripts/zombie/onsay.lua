function onSay(cid, words, param, channel)
	if(getStorage(ZE_STATUS) ~= 2) then
		local players_on_arena_count = #getZombiesEventPlayers()
		if(param == 'force') then
			if(players_on_arena_count > 0) then
				setZombiesEventPlayersLimit(players_on_arena_count  )
				addZombiesEventBlockEnterPosition()
				doSetStorage(ZE_STATUS, 2)
				doBroadcastMessage("Event Assassin Started.")
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Assasin event started.")
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Evento assassin cancelado. Nao teve participantes.")
			end
		else
			if(param ~= '' and tonumber(param) > 0) then
				setZombiesEventPlayersLimit(tonumber(param))
			end
			removeZombiesEventBlockEnterPosition()
			doSetStorage(ZE_STATUS, 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Event started.")
			doBroadcastMessage("[Evento automatico] Foi aberto o teleporte para o Event Assassin. Esperando " .. getZombiesEventPlayersLimit() - players_on_arena_count .. " players para dar inicio ao evento.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Assassin Event ja esta aberto.")
	end
	return true
end