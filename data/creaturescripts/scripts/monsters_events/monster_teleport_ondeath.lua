local bosses = {
	["Super Samurai"] = { teleport_to = { x = 3330, y = 3627, z = 8 } },
	["Super Acidwire"] = { teleport_to = { x = 3228, y = 3207, z = 8 } },
	["Ultimate Grand Fisher"] = { storage = "tessai_quest", teleport_to = { x = 3583, y = 3456, z = 8 } },
	["Zaraki Legendary"] = { teleport_to = { x = 2769, y = 3937, z = 4 } },
	["Super Arrancar"] = { teleport_to = { x = 3651, y = 4230, z = 8 } },
	["Super Hiroshi"] = { teleport_to = { x = 2789, y = 3234, z = 6 } },
	["Ultimate Hiroshi"] = { teleport_to = { x = 2789, y = 3294, z = 6 } },
}

function onDeath(cid, corpse, deathList)
	local boss = bosses[getCreatureName(cid)]

	for _, player in pairs(deathList) do
		if boss.storage then
			setPlayerStorageValue(player, boss.storage, 1)
		end

		doTeleportThing(player, boss.teleport_to)
		doSendMagicEffect(boss.teleport_to, 10)
	end

	return true
end
