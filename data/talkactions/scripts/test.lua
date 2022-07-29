local function doCustomDistanceShoot(paths)
	for key, _ in ipairs(paths) do
		if paths[key + 1] then
			local distance = 0
			if key ~= 1 then
				distance = getDistanceBetween(paths[key - 1], paths[key])
			end

			addEvent(function()
				doSendDistanceShoot(paths[key], paths[key + 1], 30)
			end, (key - 1) * (distance * (key * 60)))
		end
	end
end

function onSay(cid, words, param, channel)
	-- local cid_position = getCreaturePosition(cid)
	-- local target_position = getCreaturePosition(getCreatureTarget(cid))

	-- doSendDistanceShoot(cid_position, { x = cid_position.x + 7, y = cid_position.y, z = cid_position.z }, 30)
	-- addEvent(function()
	-- 	doSendDistanceShoot({ x = cid_position.x + 7, y = cid_position.y, z = cid_position.z }, { x = cid_position.x - 7, y = cid_position.y + 3, z = cid_position.z }, 30)
	-- end, getDistanceBetween(cid_position, { x = cid_position.x + 7, y = cid_position.y, z = cid_position.z }) * 60)
	-- addEvent(function()
	-- 	doSendDistanceShoot({ x = cid_position.x - 7, y = cid_position.y + 3, z = cid_position.z }, getCreaturePosition(getCreatureTarget(cid)), 30)
	-- end, getDistanceBetween({ x = cid_position.x + 7, y = cid_position.y, z = cid_position.z }, { x = cid_position.x - 7, y = cid_position.y + 3, z = cid_position.z }) * 120)
	-- addEvent(function()
	-- 	doSendDistanceShoot({ x = getCreaturePosition(cid).x + 7, y = getCreaturePosition(cid).y, z = getCreaturePosition(cid).z }, getCreaturePosition(getCreatureTarget(cid)), 30)
	-- end, getDistanceBetween(getCreaturePosition(cid), { x = getCreaturePosition(cid).x + 7, y = getCreaturePosition(cid).y, z = getCreaturePosition(cid).z }) * 180)

	-- doCustomDistanceShoot({
	-- 	cid_position,
	-- 	{ x = cid_position.x, y = cid_position.y + 2, z = cid_position.z },
	-- 	{ x = target_position.x, y = target_position.y + 2, z = target_position.z },
	-- 	target_position
	-- })
	-- local player = getSpectators(getCreaturePosition(cid), 1, 1)[1]
	-- doCreatureSay(cid, getCreatureName(player))

	-- doTargetCombatHealth(nil, player, COMBAT_PHYSICALDAMAGE, -100, -100, CONST_ME_EXPLOSIONHIT)
	-- doPlayerSendTutorial(cid, param)
	-- if tonumber(param) then
	-- 	doPlayerSendTutorial(cid, param)
	-- 	-- return true
	-- end
	-- addEvent(
	-- 	doPlayerPopupFYI,
	-- 	2000,
	-- 	cid,
	-- 	'lula'
	-- )
	MultiLanguage.doPlayerPopupFYI(
			cid,
			'You can verify all the techniques that your character owns with "!techniques".',
			'Você consegue verificar todas as técnicas que o seu personagem possui com "!técnicas".'
		)
	return true
end
