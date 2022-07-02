local spell = {
	cooldown = 20,
	percentage = 0.15, -- 0.15 = 15%, 0.3 = 30%...
	effect = 89
}

function onCastSpell(cid, var)
	if checkSpecialCooldown(cid) then
		return false
	end

	local life_steal = getCreatureMaxHealth(cid) * spell.percentage

	doCreatureAddHealth(cid, life_steal)
	doTargetCombatHealth(cid, getCreatureTarget(cid), COMBAT_ENERGYDAMAGE, -life_steal, -life_steal, spell.effect)

	exhaustion.set(cid, "special", spell.cooldown)
	return true
end
