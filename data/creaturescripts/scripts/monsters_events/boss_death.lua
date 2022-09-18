local bosses = {
	["Kyoraku"] = {
		position = { x = 3690, y = 3525, z = 6 },
		minutes_to_respawn = 30,
		loot = {
			{ id = 2160, chance = 1000, count = { min = 2, max = 7 } },
			{ id = 10677, chance = 20, count = { min = 1, max = 1 } },
			{ id = 10661, chance = 20, count = { min = 1, max = 1 } },
			{ id = 15252, chance = 20, count = { min = 1, max = 1 } },
			{ id = 15306, chance = 20, count = { min = 1, max = 1 } },
			{ id = 15253, chance = 20, count = { min = 1, max = 1 } },
			{ id = 15307, chance = 20, count = { min = 1, max = 1 } }
		}
	},

	["Blank"] = {
		position = { x = 3443, y = 3613, z = 0 },
		minutes_to_respawn = 30,
		loot = {
			{ id = 2160, chance = 1000, count = { min = 2, max = 7 } },
			{ id = 15222, chance = 10, count = { min = 1, max = 1 } },
			{ id = 15229, chance = 10, count = { min = 1, max = 1 } }
		}
	},

	["Legendary Vizard"] = {
		loot = {
			{ id = 2160, chance = 1000, count = { min = 2, max = 7 } },
			{ id = 16088, chance = 5, count = { min = 1, max = 1 } },
			{ id = 16087, chance = 5, count = { min = 1, max = 1 } },
			{ id = 16086, chance = 5, count = { min = 1, max = 1 } },
			{ id = 16085, chance = 5, count = { min = 1, max = 1 } }
		}
	},

	["Legendary Zangetsu"] = {
		loot = {
			{ id = 2160, chance = 1000, count = { min = 2, max = 8 } },
			{ id = 16107, chance = 10, count = { min = 1, max = 1 } },
			{ id = 16108, chance = 10, count = { min = 1, max = 1 } },
			{ id = 16109, chance = 10, count = { min = 1, max = 1 } },
			{ id = 16110, chance = 10, count = { min = 1, max = 1 } }
		}
	},

	["Legendary Nnoitra"] = {
		loot = {
			{ id = 2160, chance = 1000, count = { min = 2, max = 8 } },
			{ id = 16093, chance = 5, count = { min = 1, max = 1 } },
			{ id = 16094, chance = 5, count = { min = 1, max = 1 } },
			{ id = 16095, chance = 5, count = { min = 1, max = 1 } },
			{ id = 16096, chance = 5, count = { min = 1, max = 1 } }
		}
	},

	["Legendary Kaname"] = {
		loot = {
			{ id = 2160, chance = 1000, count = { min = 2, max = 8 } },
			{ id = 16089, chance = 10, count = { min = 1, max = 1 } },
			{ id = 16090, chance = 10, count = { min = 1, max = 1 } },
			{ id = 16091, chance = 10, count = { min = 1, max = 1 } },
			{ id = 16092, chance = 10, count = { min = 1, max = 1 } }
		}
	},

	["Perfect Barragan"] = {
		position = { x = 4222, y = 3537, z = 8 },
		minutes_to_respawn = 240,
		loot = {
			-- TODO:
		}
	},

	["Perfect Nnoitra"] = {
		position = { x = 3212, y = 2935, z = 8 },
		minutes_to_respawn = 240,
		loot = {
			-- TODO:
		}
	},

	["Perfect Adjuchas"] = {
		position = { x = 3481, y = 2637, z = 8 },
		minutes_to_respawn = 240,
		loot = {
			{ id = 2160, chance = 1000, count = { min = 2, max = 8 } },
			{ id = 15055, chance = 5, count = { min = 1, max = 1 } },
		}
	},
}

local function doSendLootMessageToSpecs(position, lootList, killerName, monsterName)
	local loot_list_message = ''

	if next(lootList) == nil then -- Check if table is empty
		loot_list_message = 'nothing.'
	else
		for key, item in ipairs(lootList) do
			if item.count > 1 then
				loot_list_message = loot_list_message .. item.count .. ' '
			else
				loot_list_message = loot_list_message .. 'a '
			end

			if key == #lootList then
				loot_list_message = loot_list_message .. getItemNameById(item.id)
				if item.count > 1 then
					loot_list_message = loot_list_message .. 's'
				end
				loot_list_message = loot_list_message .. '.'
			elseif key == #lootList - 1 then
				loot_list_message = loot_list_message .. getItemNameById(item.id)
				if item.count > 1 then
					loot_list_message = loot_list_message .. 's'
				end
				loot_list_message = loot_list_message .. ' and '
			else
				loot_list_message = loot_list_message .. getItemNameById(item.id)
				if item.count > 1 then
					loot_list_message = loot_list_message .. 's'
				end
				loot_list_message = loot_list_message .. ', '
			end
		end
	end

	for _, spec in ipairs(getSpectators(position, 7, 5)) do
		if isPlayer(spec) then
			doPlayerSendTextMessage(spec, MESSAGE_INFO_DESCR,
				'Loot Owner: ' .. killerName .. '\nLoot of ' .. monsterName .. ': ' .. loot_list_message
			)
		end
	end
end

function onDeath(cid, corpse, deathList)
	local boss = bosses[getCreatureName(cid)]

	if not boss then
		error('Boss not found. (' .. getCreatureName(cid) .. ')')
		return true
	end

	if boss.position and boss.minutes_to_respawn then
		addEvent(doCreateMonster, boss.minutes_to_respawn * 60 * 1000, boss.name, boss.position, false, true)
	end

	if boss.loot then
		local killer = deathList[1] -- Last hit killer
		local container = doCreateItemEx(2595)
		doItemSetAttribute(container, "description",
			getCreatureName(cid) .. " Loot Reward.\n" ..
			"Owner: " .. getCreatureName(killer) .. "\n" ..
			"Date: " .. os.date("%d/%m/%Y - Time: %X")
		)
		local loot_list = {}

		for _, item in ipairs(boss.loot) do
			if item.chance >= math.random(1000) then
				local count = math.random(item.count.min, item.count.max)
				table.insert(loot_list, { id = item.id, count = count })
				doAddContainerItem(container, item.id, count)
			end
		end

		doSendLootMessageToSpecs(getCreaturePosition(cid), loot_list, getCreatureName(killer), getCreatureName(cid))
		doPlayerSendMailByName(getCreatureName(killer), container, REWARD_CHEST_TOWN)
	end
	return true
end
