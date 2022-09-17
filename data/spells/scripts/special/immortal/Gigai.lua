local spell = {
	duration = 10,
	cooldown = 60
}

function onCastSpell(cid, var)
	if isInSpecialCooldown(cid) then
		return false
	end

	local player_group_id = getPlayerGroupId(cid)

	local clone = doCreateMonster("Clone", getCreaturePosition(cid), false, true)
	doCreatureChangeOutfit(clone, getCreatureOutfit(cid))
	doCreatureSetLookDir(clone, getCreatureLookDir(cid))
	doCreatureSetHideHealth(clone, true)

	doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
	setPlayerGroupId(cid, 7)
	doCreatureExecuteTalkAction(cid, "###invisible", true)
	doSetCreatureOutfit(cid, { lookType = 0 }, (spell.duration - 0.25) * 1000)
	setCreatureTarget(cid, nil)

	addEvent(function()
		if isCreature(cid) then
			doCreatureExecuteTalkAction(cid, "###invisible", true)
			setPlayerGroupId(cid, player_group_id)
		end
		if isCreature(clone) then
			doSendMagicEffect(getCreaturePosition(clone), 2)
			doRemoveCreature(clone)
		end
	end, spell.duration * 1000)

	exhaustion.set(cid, "special", spell.cooldown)
	return true
end
