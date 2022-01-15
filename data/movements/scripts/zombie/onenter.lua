function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if(not isPlayer(cid)) then
		return true
	end
	if(getPlayerAccess(cid) >= ZE_ACCESS_TO_IGNORE_ARENA) then
		addPlayerToZombiesArea(cid)
	elseif(#getZombiesEventPlayers() < getZombiesEventPlayersLimit() and getStorage(ZE_STATUS) == 1) then
		addPlayerToZombiesArea(cid)
		local players_on_arena_count = #getZombiesEventPlayers()
		if(players_on_arena_count == getZombiesEventPlayersLimit()) then
			addZombiesEventBlockEnterPosition()
			doSetStorage(ZE_STATUS, 2)
			doBroadcastMessage("Event Assassin Starter.")
		else
			doBroadcastMessage(getCreatureName(cid) .. " entrou no event assassin. Ainda faltam " .. getZombiesEventPlayersLimit() - players_on_arena_count .. " jogadores para dar inicio ao evento.")
		end
	else
		doTeleportThing(cid, fromPosition, true)
		addZombiesEventBlockEnterPosition()
	end
	return true
end