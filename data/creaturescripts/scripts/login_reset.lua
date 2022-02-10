function onLogin(cid)
    if isPlayerGhost(cid) then
        doCreatureExecuteTalkAction(cid, "###invisible", true)
    end

    doCreatureSetNoMove(cid, false)

    -- Storages
    setPlayerStorageValue(cid, "dodge_special", 0)

    -- Events
    unregisterCreatureEvent(cid, "Immortal")
    unregisterCreatureEvent(cid, "InvisibleSpellStats")
    unregisterCreatureEvent(cid, "InvisibleSpellAttack")
    unregisterCreatureEvent(cid, "InvisibleSpellTarget")
    return true
end
