function onAttack(cid, target)
    unregisterCreatureEvent(cid, "WolfAttack")

    local target_position = getCreaturePosition(target)

    for _, summon in ipairs(getCreatureSummons(cid)) do
        local summon_position = getCreaturePosition(summon)
        doSendMagicEffect(summon_position, 211)
        doSendDistanceShoot(summon_position, target_position, 65)
        doRemoveCreature(summon)
    end

    doSendMagicEffect({
        x = target_position.x + 1,
        y = target_position.y,
        z = target_position.z
    }, 90)

    local damage = getCreatureMaxHealth(cid) * 0.4

    doTargetCombatHealth(cid, target, COMBAT_ENERGYDAMAGE, -damage, -damage, CONST_ME_NONE)

    return true
end
