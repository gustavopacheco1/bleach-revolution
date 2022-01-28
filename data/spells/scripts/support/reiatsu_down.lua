function onCastSpell(cid, var)
    if getPlayerMana(cid) <= 0 then
        doPlayerSendCancel(cid, "You do not have enough reiatsu.")
        return false
    end

    local player_mana = getPlayerMana(cid)
    doPlayerAddSpentMana(cid, player_mana)
    doPlayerAddMana(cid, -player_mana)
    doSendMagicEffect(getPlayerPosition(cid), 176)
    return true
end
