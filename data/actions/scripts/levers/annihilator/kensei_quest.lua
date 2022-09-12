local minutes_to_complete = 3

local players_tile_positions = {
	{ x = 3709, y = 3286, z = 10, stackpos = 253 },
	{ x = 3709, y = 3285, z = 10, stackpos = 253 },
	{ x = 3709, y = 3284, z = 10, stackpos = 253 },
	{ x = 3709, y = 3286, z = 10, stackpos = 253 },
}

local area_positions = {
	initial = { x = 3718, y = 3285, z = 10 },
	quest = {
		entry = { x = 3694, y = 3315, z = 10 },
		top_left = { x = 3686, y = 3303, z = 10 },
		bottom_right = { x = 3728, y = 3327, z = 10 }
	}
}

local monsters_position_wave = {
	{ x = 3690, y = 3313, z = 10 },
	{ x = 3690, y = 3317, z = 10 },
	{ x = 3694, y = 3318, z = 10 },
	{ x = 3697, y = 3316, z = 10 },
	{ x = 3696, y = 3312, z = 10 },
	{ x = 3694, y = 3312, z = 10 },
	{ x = 3701, y = 3310, z = 10 },
	{ x = 3702, y = 3309, z = 10 },
	{ x = 3702, y = 3310, z = 10 },
	{ x = 3707, y = 3306, z = 10 },
	{ x = 3708, y = 3306, z = 10 },
	{ x = 3709, y = 3306, z = 10 },
	{ x = 3706, y = 3310, z = 10 },
	{ x = 3706, y = 3314, z = 10 },
	{ x = 3706, y = 3315, z = 10 },
	{ x = 3706, y = 3317, z = 10 },
	{ x = 3705, y = 3316, z = 10 },
	{ x = 3705, y = 3315, z = 10 },
	{ x = 3703, y = 3315, z = 10 },
	{ x = 3718, y = 3314, z = 10 },
	{ x = 3721, y = 3316, z = 10 },
	{ x = 3720, y = 3314, z = 10 },
	{ x = 3720, y = 3316, z = 10 },
	{ x = 3703, y = 3324, z = 10 },
	{ x = 3704, y = 3324, z = 10 },
	{ x = 3705, y = 3323, z = 10 },
	{ x = 3711, y = 3322, z = 10 },
	{ x = 3710, y = 3322, z = 10 },
	{ x = 3710, y = 3323, z = 10 },
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
