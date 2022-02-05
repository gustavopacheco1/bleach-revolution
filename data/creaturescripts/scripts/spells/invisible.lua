function onTarget(cid, target)
    MultiLanguage.doPlayerSendCancel(
        cid,
        "You may not attack while invisible.",
        "Você não pode atacar enquanto estiver invisível."
    )
    return false
end

function onAttack(cid, target)
    return false
end

function onStatsChange(cid, attacker, type, combat, value)
    if value >= 1 and (type == STATSCHANGE_HEALTHLOSS or (type == STATSCHANGE_MANALOSS and getCreatureCondition(cid, CONDITION_MANASHIELD))) then
        return false
    end
    return true
end
