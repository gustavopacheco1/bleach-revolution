local bosses = {
	{ name = "Kyoraku", position = { x = 3690, y = 3525, z = 6 } },
	{ name = "Blank", position = { x = 3443, y = 3613, z = 0 } },
	{ name = "Perfect Barragan", position = { x = 4222, y = 3537, z = 8 } },
	{ name = "Perfect Nnoitra", position = { x = 3212, y = 2935, z = 8 } },
	{ name = "Perfect Adjuchas", position = { x = 3481, y = 2637, z = 8 } },
}

function onStartup()
	for _, boss in ipairs(bosses) do
		doCreateMonster(boss.name, boss.position, false, true)
	end
	return true
end
