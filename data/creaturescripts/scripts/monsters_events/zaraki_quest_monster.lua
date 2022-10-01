-- Bosses according to storage
local bosses = {
	[0] = "Super Zaraki",
	[1] = "Master Zaraki",
	[2] = "Perfect Zaraki",
	[3] = "Ultimate Zaraki",
}

function onDeath(cid, corpse, deathList)
	local boss_name = bosses[getCreatureStorage(cid, "wave")]

	if not boss_name then
		error("Boss name not found (" .. getCreatureName(cid) .. ") (" .. getCreatureStorage(cid, "wave") .. ")")
		return true
	end

	local monsters_amount = #getCreaturesInRange(
		{ x = 2674, y = 3888, z = 8 },
		{ x = 2698, y = 3910, z = 8 },
		"Zaraki"
	)

	if monsters_amount > 1 then
		return true
	end

	-- Spawn in the center of the room
	local boss = doCreateMonster(boss_name, { x = 2684, y = 3898, z = 8 }, false, true)
	registerCreatureEvent(boss, "ZarakiQuestBoss")
	return true
end
