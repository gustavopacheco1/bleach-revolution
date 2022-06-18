local spell = {
    duration = 10,
    cooldown = 60
}

function onCastSpell(cid, var)
    if checkSpecialCooldown(cid) then
        return false
    end

	for i = 0, spell.duration-1 do
		addEvent(function()
			doSendMagicEffect(getCreaturePosition(cid), 620)
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
