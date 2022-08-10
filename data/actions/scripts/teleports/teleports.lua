local teleports = {
	[20000] = { position = { x = 3587, y = 3463, z = 8 } },
	[20001] = { position = { x = 3434, y = 3585, z = 8 }, level = 100 },
	[20002] = { position = { x = 2434, y = 3391, z = 7 }, level = 230 },
	[20003] = { position = { x = 2433, y = 3395, z = 7 }, level = 230 },
	[20004] = { position = { x = 3203, y = 2812, z = 15 }, storage = { key = "menus_florest_access", value = 1 }, effect = {id = 111, x = 1, y = 0} },
	[20005] = { position = { x = 3371, y = 4116, z = 7 }, level = 230 },
	[20006] = { position = { x = 3379, y = 4115, z = 7 }, level = 230 },
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local teleport = teleports[getItemAttribute(item.uid, "uid")]

	if teleport.storage then
		if getCreatureStorage(cid, teleport.storage.key) ~= teleport.storage.value then
			return false
		end
	end

	if teleport.level then
		if getPlayerLevel(cid) < teleport.level then
			return MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_INFO_DESCR,
				"You need to be level " .. teleport.level .. " to pass.",
				"Você precisa ser nível " .. teleport.level .. " para passar."
			)
		end
	end

	doTeleportThing(cid, teleport.position)

	if teleport.effect then
		doSendMagicEffect({
			x = teleport.position.x + teleport.effect.x,
			y = teleport.position.y + teleport.effect.y,
			z = teleport.position.z
		}, teleport.effect.id)
	end
	return true
end
