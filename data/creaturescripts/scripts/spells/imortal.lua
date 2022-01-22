function onStatsChange(cid, attacker, type, combat, value)
    if not (value >= 1 and (type == STATSCHANGE_HEALTHLOSS or (type == STATSCHANGE_MANALOSS and getCreatureCondition(cid, CONDITION_MANASHIELD)))) then
        return true
    end
    
    if not (getPlayerStorageValue(cid, "imortal") > 0) then
        return true
    end
    
    return false
end
