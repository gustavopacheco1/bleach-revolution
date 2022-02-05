function onLogin(cid)
    setPlayerStorageValue(cid, "dodge_special", 0)
    
    if isPlayerGhost(cid) then
        doCreatureExecuteTalkAction(cid, "###invisible", true)
    end
    unregisterCreatureEvent(cid, "InvisibleSpellStats")
    unregisterCreatureEvent(cid, "InvisibleSpellAttack")
    unregisterCreatureEvent(cid, "InvisibleSpellTarget")
    return true
end
