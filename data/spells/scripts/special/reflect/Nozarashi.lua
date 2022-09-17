local spell = {
	cooldown = 30,
	total_hits = 5, -- Numero de hits que a spell irá refletir
}

function onCastSpell(cid, var)
	if isInSpecialCooldown(cid) then
		return false
	end

	registerCreatureEvent(cid, "ReflectNozarashi")
	setPlayerStorageValue(cid, "reflect", spell.total_hits)
	exhaustion.set(cid, "special", spell.cooldown)
	return true
end
