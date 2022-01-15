function onCastSpell(cid, var) 
ppos = getPlayerPosition(cid) 
    if getPlayerMana(cid) > 1 then
            doPlayerAddSpentMana(cid, getPlayerMana(cid))
            doPlayerAddMana(cid,-getPlayerMana(cid))
            doSendMagicEffect(ppos,24)
    end
return true
end