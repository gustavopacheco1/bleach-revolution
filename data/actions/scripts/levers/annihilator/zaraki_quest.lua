local minutes_to_complete = 3

local tile_position = { x = 2770, y = 3907, z = 8 }

local area_positions = {
	initial = { x = 2777, y = 3900, z = 8 },
	room = {
		entry = { x = 2685, y = 3898, z = 8 },
		top_left = { x = 2674, y = 3888, z = 8 },
		bottom_right = { x = 2698, y = 3910, z = 8 },
	},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1946 then
		doTransformItem(item.uid, 1945)
		return
	end

	local player_position = getCreaturePosition(cid)

	if not doComparePositions(player_position, tile_position) then
		return
	end

	if getCreatureStorage(cid, "zaraki_quest") ~= 0 then
		return MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_INFO_DESCR,
			"You've already done this quest.",
			"Você já fez esta quest."
		)
	end

	if #getPlayersInRange(area_positions.room.top_left, area_positions.room.bottom_right) > 0 then
		return MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_INFO_DESCR,
			"There's already people doing this quest.",
			"Já há pessoas fazendo esta quest."
		)
	end

	doTeleportThing(cid, area_positions.room.entry)
	doSendMagicEffect(area_positions.room.entry, CONST_ME_TELEPORT)
	MultiLanguage.doPlayerSendTextMessage(
		cid,
		MESSAGE_EVENT_ADVANCE,
		"Your team has " .. minutes_to_complete .. " minutes to deal with this challenge.",
		"O seu time tem " .. minutes_to_complete .. " minutos para lidar com este desafio."
	)

	addEvent(function()
		if not isCreature(cid) then
			return
		end

		if isInArea(
			getCreaturePosition(cid),
			area_positions.room.top_left,
			area_positions.room.bottom_right
		) then
			doTeleportThing(cid, area_positions.initial)
			doSendMagicEffect(area_positions.initial, CONST_ME_TELEPORT)
		end
	end, minutes_to_complete * 60 * 1000)

	local monsters = doCreateMonstersInRange("Zaraki", 15, area_positions.room.top_left, area_positions.room.bottom_right)
	for _, monster in ipairs(monsters) do
		registerCreatureEvent(monster, "ZarakiQuestMonster")
	end

	addEvent(
		doRemoveCreaturesInRange,
		minutes_to_complete * 60 * 1000,
		area_positions.room.top_left,
		area_positions.room.bottom_right,
		nil
	)

	doTransformItem(item.uid, 1946)
	return true
end
