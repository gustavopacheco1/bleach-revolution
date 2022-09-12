function onDeath(cid, corpse, deathList)
	local monsters_amount = #getCreaturesInRange(
		{ x = 3687, y = 3305, z = 10 },
		{ x = 3725, y = 3325, z = 10 },
		"Kensei"
	)

	if monsters_amount > 1 then
		return true
	end

	doCreateMonster("Super Kensei", { x = 3706, y = 3314, z = 10 })
	return true
end
