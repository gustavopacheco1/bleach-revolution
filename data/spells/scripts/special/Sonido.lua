local spell = {
	cooldown = 50,
	effect = 352,
}

function onCastSpell(cid, var)
	if checkSpecialCooldown(cid) then
		return false
	end

	local target_position = getCreaturePosition(getCreatureTarget(cid))

	doTeleportThing(cid, target_position)
	doSendMagicEffect(target_position, spell.effect)

	exhaustion.set(cid, "special", spell.cooldown)
	return true
end
