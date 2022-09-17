local spell = {
	cooldown = 50,
	duration = 3,
	effect = 20,
}

function onCastSpell(cid, var)
	if isInSpecialCooldown(cid) then
		return false
	end

	local target = getCreatureTarget(cid)

	if not (isPlayer(target)) then
		MultiLanguage.doPlayerSendCancel(
			cid,
			"You may only use this technique in players.",
			"Você só pode utilizar esta técnica em players."
		)
		return false
	end

	doSendMagicEffect(getCreaturePosition(target), spell.effect)
	doMutePlayer(cid, spell.duration, EXHAUST_SPELLGROUP_HEALING)

	exhaustion.set(cid, "special", spell.cooldown)
	return true
end
