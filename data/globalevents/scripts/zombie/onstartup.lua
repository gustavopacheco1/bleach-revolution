function onStartup()
	db.executeQuery("UPDATE `player_storage` SET `value` = 0 WHERE `key` = " .. ZE_isOnZombieArea .. ";")
	doSetStorage(ZE_STATUS, 0)
	doSetStorage(ZE_PLAYERS_NUMBER, ZE_DEFAULT_NUMBER_OF_PLAYERS)
	doSetStorage(ZE_ZOMBIES_TO_SPAWN, 0)
	doSetStorage(ZE_ZOMBIES_SPAWNED, 0)
	addZombiesEventBlockEnterPosition()
	return true
end