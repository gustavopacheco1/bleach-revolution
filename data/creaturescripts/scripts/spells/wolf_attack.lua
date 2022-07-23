function onAttack(cid, target)
	unregisterCreatureEvent(cid, "WolfAttack")
	setPlayerStorageValue(cid, "special", nil)

	local target_position = getCreaturePosition(target)

	for _, summon in ipairs(getCreatureSummons(cid)) do
		local summon_position = getCreaturePosition(summon)
		doSendMagicEffect(summon_position, 343)
		doSendDistanceShoot(summon_position, target_position, 87)
		doRemoveCreature(summon)
	end

	doSendMagicEffect({
		x = target_position.x + 1,
		y = target_position.y,
		z = target_position.z
	}, 121)

	local damage = getCreatureMaxHealth(cid) * 0.4

	doTargetCombatHealth(cid, target, COMBAT_ENERGYDAMAGE, -damage, -damage, CONST_ME_NONE)

	return true
end
