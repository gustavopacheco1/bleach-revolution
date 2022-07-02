local minutes_to_complete = 60

local players_position = {
	{ x = 3805, y = 3650, z = 9, stackpos = 253 },
	{ x = 3806, y = 3650, z = 9, stackpos = 253 },
	{ x = 3807, y = 3650, z = 9, stackpos = 253 },
	{ x = 3808, y = 3650, z = 9, stackpos = 253 }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1946 then
		doTransformItem(item.uid, 1945)
		return
	end

	local player_position = getCreaturePosition(cid)

	if not
		(
		player_position.x == players_position[1].x and player_position.y == players_position[1].y and
			player_position.z == players_position[1].z) then
		return
	end

	for i = 1, #players_position do
		if not (isPlayer(getThingFromPosition(players_position[i]).uid)) then
			return MultiLanguage.doPlayerSendCancel(
				cid,
				"You need mates to fill all the spots to face this challenge.",
				"Você precisa de companheiros para preencher todos os espaços para encarar este desafio."
			)
		end
	end


	for i = 1, #players_position do
		local thing = getThingFromPosition(players_position[i]).uid

		doTeleportThing(thing, { x = 4545, y = 3850, z = 7 })
		doSendMagicEffect({ x = 4545, y = 3850, z = 7 }, 10)
		MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_EVENT_ADVANCE,
			"Your team has " .. minutes_to_complete .. " minutes to deal with this challenge.",
			"O seu time tem " .. minutes_to_complete .. " minutos para lidar com este desafio."
		)

		addEvent(
			function()
				if isPlayer(thing) then
					if isInArea(getCreaturePosition(thing), { x = 4406, y = 3748, z = 7 }, { x = 4678, y = 3984, z = 7 }) then
						doTeleportThing(thing, { x = 3805, y = 3653, z = 9 })
						doSendMagicEffect({ x = 3805, y = 3653, z = 9 }, 10)
					end
				end
			end,
			minutes_to_complete * 60 * 1000
		)
	end

	doTransformItem(item.uid, 1946)
	return true
end
