function onStatsChange(cid, attacker, type, combat, value)
    if getPlayerStorageValue(cid, "imortal") > 0 then
        return false
    end
    
    return true
end
