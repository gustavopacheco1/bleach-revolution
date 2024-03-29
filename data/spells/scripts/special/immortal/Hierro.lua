local spell = {
	duration = 5,
	cooldown = 30
}

function onCastSpell(cid, var)
	if isInSpecialCooldown(cid) then
		return false
	end

	for i = 0, spell.duration - 1 do
		addEvent(function()
			local player_position = getCreaturePosition(cid)
			doSendMagicEffect({
				x = player_position.x,
				y = player_position.y,
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
