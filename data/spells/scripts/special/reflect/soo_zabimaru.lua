local spell = {
	cooldown = 30,
	total_hits = 5, -- Numero de hits que a spell ir� refletir
}

function onCastSpell(cid, var)
	if checkSpecialCooldown(cid) then
		return false
	end

	registerCreatureEvent(cid, "ReflectSooZabimaru")
	setPlayerStorageValue(cid, "reflect", spell.total_hits)
	exhaustion.set(cid, "special", spell.cooldown)
	return true
end
