local spell = {
	cooldown = 10,
	effect_on_cast = 90,
	loops = 10,
	loop_effect = 189,
}

function onCastSpell(cid, var)
	if isInSpecialCooldown(cid) then
		return false
	end

	local target = getCreatureTarget(cid)

	for i = 1, spell.loops do
		addEvent(function()
			if not isCreature(cid) or not isCreature(target) then
				return
			end

			local health = getCreatureMaxHealth(cid) * 0.05
			local target_position = getCreaturePosition(target)

			doCreatureAddHealth(cid, health)
			doCreatureAddHealth(target, -health)
			doSendMagicEffect(getCreaturePosition(cid), spell.loop_effect)
			doSendMagicEffect(target_position, spell.loop_effect)
			doSendAnimatedText(target_position, health, COLOR_BLACK)
		end, i * 1000)
	end

	doSendMagicEffect(getCreaturePosition(target), spell.effect_on_cast)
	exhaustion.set(cid, "special", spell.cooldown)
	return true
end
