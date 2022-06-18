function onStatsChange(cid, attacker, type, combat, value)
    if combat ~= COMBAT_PHYSICALDAMAGE then
        return true
    end

    if getPlayerStorageValue(cid, "physical_protection") == 0 then
        local damage = getCreatureMaxHealth(cid) * 0.4
        doTargetCombatHealth(cid, attacker, COMBAT_ENERGYDAMAGE, -damage, -damage, CONST_ME_NONE)

        setPlayerStorageValue(cid, "physical_protection", nil)
        unregisterCreatureEvent(cid, "PhysicalProtection")
        return true
    end

    setPlayerStorageValue(cid, "physical_protection", getPlayerStorageValue(cid, "physical_protection")-1)
    doSendAnimatedText(getCreaturePosition(cid), "Miss", COLOR_WHITE)
    return false
end
