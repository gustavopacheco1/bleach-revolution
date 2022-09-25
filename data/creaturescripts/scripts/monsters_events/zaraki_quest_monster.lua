local waves = {
	["Super Zaraki"] = {
		prewave_monsters_amount = 15,
		next_wave = "Master Zaraki"
	},
	["Master Zaraki"] = {
		prewave_monsters_amount = 30,
		next_wave = "Master Zaraki"
	},
	["Perfect Zaraki"] = {
		prewave_monsters_amount = 45,
		next_wave = "Master Zaraki"
	},
	["Ultimate Zaraki"] = {
		prewave_monsters_amount = 60,
		teleport_to = { x = 2648, y = 3896, z = 8 }
	},
}

-- TODO:
function onDeath(cid, corpse, deathList)
	local wave = waves[getCreatureName(cid)]

	if not wave then
		-- Normal Zaraki wave monsters
		local monsters_amount = #getCreaturesInRange(
			{ x = 3687, y = 3305, z = 10 },
			{ x = 3725, y = 3325, z = 10 },
			"Zaraki"
		)

		if monsters_amount > 1 then
			return true
		end
	end

	return true
end
