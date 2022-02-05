function onStatsChange(cid, attacker, type, combat, value)
    if not (value >= 1 and (type == STATSCHANGE_HEALTHLOSS or (type == STATSCHANGE_MANALOSS and getCreatureCondition(cid, CONDITION_MANASHIELD)))) then
        return true
    end

    if not (getPlayerStorageValue(cid, "reflect") > 0) then
        unregisterCreatureEvent(cid, "ReflectNozarashi")
        return true
    end

    local player_position = getCreaturePosition(cid)

    doSendMagicEffect(player_position, 508)
    doSendAnimatedText(player_position, "Reflect", 215)
    doSendAnimatedText(getCreaturePosition(attacker), value, 215)
    doCreatureAddHealth(attacker, -value)
    setPlayerStorageValue(cid, "reflect", getPlayerStorageValue(cid, "reflect") - 1)
    return false
end
