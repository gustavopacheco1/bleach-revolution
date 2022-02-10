local spell = {
    cooldown = 10,
    percentage = 0.15, -- 0.15 = 15%, 0.3 = 30%...
    effect = 30
}

function onCastSpell(cid, combat, var)
    if exhaustion.check(cid, "special") then
        doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") .. "s")
        return true
    end

    local life_steal = getCreatureMaxHealth(cid)*spell.percentage

    doCreatureAddHealth(cid, life_steal)
    doTargetCombatHealth(cid, getCreatureTarget(cid), COMBAT_PHYSICALDAMAGE, -life_steal, -life_steal, 30)

    exhaustion.set(cid, "special", spell.cooldown)
    return true
end
