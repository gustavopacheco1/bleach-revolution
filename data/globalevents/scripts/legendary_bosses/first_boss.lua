function onTime(time)
	local boss_spawned = tonumber(getStorage("boss_spawned"))
	if boss_spawned ~= -1 then
		if isCreature(boss_spawned) then
			doRemoveCreature(boss_spawned)
		end
	end

	local boss_key = tonumber(getStorage("boss"))
	if boss_key == 4 then
		doSetStorage("boss", 1)
	else
		doSetStorage("boss", boss_key + 1)
	end

	doCreateLegendaryBoss()
	return true
end
