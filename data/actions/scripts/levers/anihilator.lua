local minutes_to_complete = 60

local players_tile_positions = {
	{ x = 3805, y = 3650, z = 9, stackpos = 253 },
	{ x = 3806, y = 3650, z = 9, stackpos = 253 },
	{ x = 3807, y = 3650, z = 9, stackpos = 253 },
	{ x = 3808, y = 3650, z = 9, stackpos = 253 }
}

local area_positions = {
	initial = { x = 3805, y = 3653, z = 9 },
	quest = {
		entry = { x = 5316, y = 3618, z = 8 },
		top_left = { x = 5175, y = 3510, z = 8 },
		bottom_right = { x = 5461, y = 3754, z = 8 }
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

	for i = 1, #players_tile_positions do
		if not (isPlayer(getThingFromPosition(players_tile_positions[i]).uid)) then
			return MultiLanguage.doPlayerSendCancel(
				cid,
				"You need mates to fill all the spots to face this challenge.",
				"Você precisa de companheiros para preencher todos os espaços para encarar este desafio."
			)
		end
	end


	for i = 1, #players_tile_positions do
		local thing = getThingFromPosition(players_tile_positions[i]).uid

		doTeleportThing(thing, area_positions.quest.entry)
		doSendMagicEffect(area_positions.quest.entry, CONST_ME_POFF)
		MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_EVENT_ADVANCE,
			"Your team has " .. minutes_to_complete .. " minutes to deal with this challenge.",
			"O seu time tem " .. minutes_to_complete .. " minutos para lidar com este desafio."
		)

		addEvent(
			function()
				if isPlayer(thing) then
					if isInArea(getCreaturePosition(thing), area_positions.quest.top_left, area_positions.quest.bottom_right) then
						doTeleportThing(thing, area_positions.initial)
						doSendMagicEffect(area_positions.initial, CONST_ME_POFF)
					end
				end
			end,
			minutes_to_complete * 60 * 1000
		)
	end

	doTransformItem(item.uid, 1946)
	return true
end
