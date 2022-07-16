local bosses = {
	{ name = "Kyoraku", position = { x = 3690, y = 3525, z = 6 } },
	{ name = "Blank", position = { x = 3443, y = 3613, z = 0 } }
}

function onStartup()
	for _, boss in ipairs(bosses) do
		doCreateMonster(boss.name, boss.position, false, true)
	end
	return true
end
