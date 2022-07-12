local spell = {
	cooldown = 70,
	duration = 3,
	effect = 216
}

function onCastSpell(cid, var)
	if checkSpecialCooldown(cid) then
		return false
	end

	local target = getCreatureTarget(cid)
	local target_position = getCreaturePosition(target)

	-- Código para efeitos que não é preciso centralizar
	doSendMagicEffect(target_position, spell.effect)

	-- Código para efeitos que é preciso centralizar
	--[[

    doSendMagicEffect({
        x = target_position.x = 1,
        y = target_position.y = 1,
        z = target_position.z,
    }, spell.effect)

    --]]

	registerCreatureEvent(target, "Immortal")
	doCreatureSetNoMove(target, true)

	addEvent(function()
		if isCreature(target) then
			unregisterCreatureEvent(target, "Immortal")
			doCreatureSetNoMove(target, false)
		end
	end, spell.duration * 1000)

	exhaustion.set(cid, "special", spell.cooldown)
	return true
end
