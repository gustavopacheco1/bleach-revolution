function onLogin(cid)
    if isPlayerGhost(cid) then
        doCreatureExecuteTalkAction(cid, "###invisible", true)
    end

    doCreatureSetNoMove(cid, false)

    -- Storages
    setPlayerStorageValue(cid, "dodge_special", 0)
    if getPlayerStorageValue(cid, "extra_life") == -1 then
        setPlayerStorageValue(cid, "extra_life", 0)
    end

    -- Events
    unregisterCreatureEvent(cid, "Immortal")
    unregisterCreatureEvent(cid, "InvisibleSpellStats")
    unregisterCreatureEvent(cid, "InvisibleSpellAttack")
    unregisterCreatureEvent(cid, "InvisibleSpellTarget")
    return true
end
