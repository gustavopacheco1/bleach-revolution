local spell = {
	duration = 10,
	cooldown = 60
}

function onCastSpell(cid, var)
	if checkSpecialCooldown(cid) then
		return false
	end

	for i = 0, spell.duration - 1 do
		addEvent(function()
			local player_position = getCreaturePosition(cid)
			doSendMagicEffect({
				x = player_position.x + 1,
				y = player_position.y + 1,
				z = player_position.z
			}, 748)
		end, i * 1000)
	end

	registerCreatureEvent(cid, "Immortal")
	doCreatureSetNoMove(cid, true)

	addEvent(function()
		if isCreature(cid) then
			unregisterCreatureEvent(cid, "Immortal")
			doCreatureSetNoMove(cid, false)
		end
	end, spell.duration * 1000)

	exhaustion.set(cid, "special", spell.cooldown)
	return true
end
