local waves = {
	-- Wave 0
	["Super Zaraki"] = {
		next_wave = 1,
		next_wave_monsters_amount = 15,
	},

	-- Wave 1
	["Master Zaraki"] = {
		next_wave = 2,
		next_wave_monsters_amount = 30,
	},

	-- Wave 2
	["Perfect Zaraki"] = {
		next_wave = 3,
		next_wave_monsters_amount = 45,
	},

	-- Wave 3
	["Ultimate Zaraki"] = {
		teleport_to = { x = 2648, y = 3896, z = 8 },
		next_wave_monsters_amount = 60,
	},
}

function onDeath(cid, corpse, deathList)
	local wave = waves[getCreatureName(cid)]

	if not wave then
		error("Boss not found (" .. getCreatureName(cid) .. ")")
		return true
	end

	if wave.teleport_to then
		for _, killer in ipairs(deathList) do
			if isPlayer(killer) then
				doTeleportThing(killer, wave.teleport_to)
			end
		end
	end

	local monsters = doCreateMonstersInRange("Zaraki", wave.next_wave_monsters_amount, { x = 2674, y = 3888, z = 8 }, { x = 2698, y = 3910, z = 8 })
	for _, monster in ipairs(monsters) do
		doCreatureSetStorage(monster, "wave", wave.next_wave)
		registerCreatureEvent(monster, "ZarakiQuestMonster")
	end
	return true
end
