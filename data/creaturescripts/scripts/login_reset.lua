function onLogin(cid)
	if isPlayerGhost(cid) then
		if not isInArray({ 4, 5, 6 }, getPlayerGroupId(cid)) then
			doCreatureExecuteTalkAction(cid, "###invisible", true)
		else
			doSetCreatureOutfit(cid, { lookType = 0 }, -1)
		end
	end

	local player_group_id = getPlayerGroupId(cid)
	if player_group_id == 7 then
		if getPlayerStorageValue(cid, "group") ~= 0 then
			setPlayerGroupId(cid, getPlayerStorageValue(cid, "group"))
		else
			setPlayerGroupId(cid, 1)
		end
	end

	if player_group_id ~= 7 and player_group_id ~= getPlayerStorageValue(cid, "group") then
		setPlayerStorageValue(cid, "group", player_group_id)
	end

	doCreatureSetNoMove(cid, false)
	doPlayerFormula(cid)

	-- Storages
	setPlayerStorageValue(cid, "disable_gate_expertise", nil)
	setPlayerStorageValue(cid, "special", nil)

	for _, storage in ipairs({
		{ "energyDamage", "tempEnergyDamage" },
		{ "energyAbsorb", "tempEnergyAbsorb" },
		{ "phyisicalDamage", "tempPhysicalDamage" },
		{ "physicalAbsorb", "tempPhysicalAbsorb" }
	}) do
		if getCreatureStorage(cid, storage[2]) ~= 0 then
			doCreatureSetStorage(cid, storage[1], getCreatureStorage(cid, storage[1]) - getCreatureStorage(cid, storage[2]))
		end
		doCreatureSetStorage(cid, storage[2], nil)
	end
	return true
end
