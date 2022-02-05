function onCastSpell(cid, var)
    if getPlayerMana(cid) > 1 then
        doPlayerAddSpentMana(cid, getPlayerMana(cid))
        doPlayerAddMana(cid, -getPlayerMana(cid))
        doSendMagicEffect(getPlayerPosition(cid), 176)
    end
    return true
end
