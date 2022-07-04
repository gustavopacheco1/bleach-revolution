local spell = {
	cooldown = 50,
	duration = 30,
	effect = 488,
	energy_damage = 50 -- Porcentagem de quanto o dano das spells vai aumentar
}

function onCastSpell(cid, var)
	if checkSpecialCooldown(cid) then
		return false
	end

	local player_position = getCreaturePosition(cid)

	doSendMagicEffect({
		x = player_position.x,
		y = player_position.y,
		z = player_position.z,
	}, spell.effect)

	doCreatureSetStorage(cid, "energyDamage", getCreatureStorage(cid, "energyDamage") + spell.energy_damage)
	doCreatureSetStorage(cid, "tempEnergyDamage", getCreatureStorage(cid, "tempEnergyDamage") + spell.energy_damage)

	addEvent(function()
		if not isCreature(cid) then
			return
		end

		if isInArray(getCreatureStorageList(cid), "tempEnergyDamage") then
			doCreatureSetStorage(cid, "energyDamage", getCreatureStorage(cid, "energyDamage") - spell.energy_damage)
			doCreatureSetStorage(cid, "tempEnergyDamage", getCreatureStorage(cid, "tempEnergyDamage") - spell.energy_damage)
		end
	end, spell.duration * 1000)

	exhaustion.set(cid, "special", spell.cooldown)
	return true
end
