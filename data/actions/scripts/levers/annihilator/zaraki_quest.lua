local minutes_to_complete = 3

local players_tile_positions = {
	{ x = 3709, y = 3286, z = 10, stackpos = 253 },
	{ x = 3709, y = 3285, z = 10, stackpos = 253 },
	{ x = 3709, y = 3284, z = 10, stackpos = 253 },
	{ x = 3709, y = 3286, z = 10, stackpos = 253 },
}

local area_positions = {
	initial = { x = 2777, y = 3900, z = 8 },
	quest = {
		entry = { x = 2685, y = 3899, z = 8 },
		top_left = { x = 2674, y = 3888, z = 8 },
		bottom_right = { x = 2698, y = 3910, z = 8 }
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1946 then
		doTransformItem(item.uid, 1945)
		return
	end

	local player_position = getCreaturePosition(cid)

	if not
		(
		player_position.x == players_tile_positions[1].x and player_position.y == players_tile_positions[1].y and
			player_position.z == players_tile_positions[1].z) then
		return
	end

	if getCreatureStorage(cid, "kensei_set_quest") ~= 0 then
		return MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_INFO_DESCR,
			"You've already done this quest.",
			"Você já fez esta quest."
		)
	end

	if #getPlayersInRange(area_positions.quest.top_left, area_positions.quest.bottom_right) > 0 then
		return MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_INFO_DESCR,
			"There's already people doing this quest.",
			"Já há pessoas fazendo esta quest."
		)
	end

	for _, player_tile_position in ipairs(players_tile_positions) do
		local thing = getThingFromPosition(player_tile_position).uid

		if isPlayer(thing) then
			if getCreatureStorage(cid, "kensei_set_quest") == 0 then
				doTeleportThing(thing, area_positions.quest.entry)
				doSendMagicEffect(area_positions.quest.entry, CONST_ME_TELEPORT)
				MultiLanguage.doPlayerSendTextMessage(
					cid,
					MESSAGE_EVENT_ADVANCE,
					"Your team has " .. minutes_to_complete .. " minutes to deal with this challenge.",
					"O seu time tem " .. minutes_to_complete .. " minutos para lidar com este desafio."
				)

				addEvent(
					function()
						if not isPlayer(thing) then
							return
						end

						if isInArea(getCreaturePosition(thing), area_positions.quest.top_left, area_positions.quest.bottom_right) then
							doTeleportThing(thing, area_positions.initial)
							doSendMagicEffect(area_positions.initial, CONST_ME_TELEPORT)
						end
					end,
					minutes_to_complete * 60 * 1000
				)
			end
		end
	end

	for _, monster_position in ipairs(monsters_position_wave) do
		local monster = doCreateMonster("Kensei", monster_position)
		registerCreatureEvent(monster, "KenseiQuestMonster")
	end

	addEvent(
		doRemoveCreaturesInRange,
		minutes_to_complete * 60 * 1000,
		area_positions.quest.top_left,
		area_positions.quest.bottom_right,
		nil
	)

	doTransformItem(item.uid, 1946)
	return true
end
