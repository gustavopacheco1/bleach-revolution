function onDeath(cid, corpse, deathList)
	for _, killer in pairs(deathList) do
		if getPlayerStorageValue(killer, "yamamoto_task_monster") == getCreatureName(cid) then
			setPlayerStorageValue(killer, "yamamoto_task_kills", getPlayerStorageValue(killer, "yamamoto_task_kills") + 1)
		end
	end

	return true
end
