function onDeath(cid, corpse, deathList)
	local creature_name = getCreatureName(cid)

	for _, killer in pairs(deathList) do
		if getPlayerStorageValue(killer, "yamamoto_task_monster") == creature_name then
			local kills = getPlayerStorageValue(killer, "yamamoto_task_kills")
			local total_kills = getPlayerStorageValue(killer, "yamamoto_task_total_kills")

			print(kills)
			print(total_kills)
			if total_kills > kills then
				local plural = ""
				if kills > 0 then
					plural = "s"
				end

				doCreatureSetStorage(killer, "yamamoto_task_kills", kills + 1)
				MultiLanguage.doPlayerSendTextMessage(
					killer,
					MESSAGE_EVENT_ORANGE,
					"[Yamamoto Task] You've killed " .. kills + 1 .. " " .. creature_name .. plural .. " of " .. total_kills .. ".",
					"[Yamamoto Task] Você matou " .. kills + 1 .. " " .. creature_name .. plural .. " de " .. total_kills .. "."
				)
			end
		end
	end

	return true
end
