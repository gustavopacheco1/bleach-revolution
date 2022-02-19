function onStatsChange(cid, attacker, type, combat, value)
    if not (value >= 1 and (type == STATSCHANGE_HEALTHLOSS) or combat == COMBAT_PHYSICALDAMAGE or isPlayer(attacker)) then
        return true
    end

    if not (exhaustion.check(attacker, "trainer_shielding")) then
        return true
    end

    doPlayerAddSkillTry(attacker, SKILL_SHIELD, 1)
    doSendDistanceShoot(getCreaturePosition(cid), getCreaturePosition(attacker), 44)
    return true
end
