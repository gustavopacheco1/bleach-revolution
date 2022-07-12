local legendary_bosses = {
	{ name = "Legendary Vizard", position = { x = 4041, y = 2678, z = 9 } },
	{ name = "Legendary Nnoitra", position = { x = 4240, y = 3991, z = 9 } },
	{ name = "Legendary Zangetsu", position = { x = 3609, y = 4083, z = 4 } },
	{ name = "Legendary Kaname", position = { x = 4133, y = 2681, z = 4 } },
}

function doCreateLegendaryBoss()
	if getStorage("boss_spawned") ~= -1 then
		if isCreature(tonumber(getStorage("boss_spawned"))) then
			return
		end
	end

	local boss = legendary_bosses[getStorage("boss")]

	if not boss then
		error('Boss not found.')
		return
	end

	local boss_spawned = doCreateMonster(boss.name, boss.position, false, true)
	doSetStorage("boss_spawned", boss_spawned)
	return true
end
