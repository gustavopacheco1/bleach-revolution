function onThink(interval, lastExecution, thinkInterval)
	if(getStorage(ZE_STATUS) == 2) then
		setZombiesToSpawnCount(getZombiesToSpawnCount()+1)
		local players = getZombiesEventPlayers()
		for i=1, getZombiesToSpawnCount() * 2 do
			if(getZombiesToSpawnCount() > 0 and spawnNewZombie()) then
				setZombiesToSpawnCount(getZombiesToSpawnCount()-1)
			end
		end
	end
	return true
end