function onUse(cid, item, fromPosition, itemEx, toPosition)
	local target = itemEx.uid

	if not isPlayer(target) then
		return true
	end

	if getPlayerStamina(cid) == 2520 then
		return MultiLanguage.doPlayerSendCancel(
			cid,
			"You cannot use this object. You're already full stamina.",
			"Você não pode utilizar este objeto. Sua energia já está cheia."
		)
	end

	local target_position = getCreaturePosition(target)
	doSendMagicEffect({
		x = target_position.x + 1,
		y = target_position.y + 1,
		z = target_position.z
	}, 86)

	-- Set full stamina
	doPlayerSetStamina(target, 2520)

	doRemoveItem(item.uid, 1)
	return true
end
