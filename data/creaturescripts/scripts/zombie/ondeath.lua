function onDeath(cid)
	setZombiesToSpawnCount(getZombiesToSpawnCount() + 2)
	doCreatureSay(cid, "I'll be back!", 19)
	return true
end