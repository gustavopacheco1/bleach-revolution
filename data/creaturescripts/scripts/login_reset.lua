function onLogin(cid)
    if isPlayerGhost(cid) and not isInArray({4, 5, 6}, getPlayerGroupId(cid)) then
        doCreatureExecuteTalkAction(cid, "###invisible", true)
    end

    local player_group_id = getPlayerGroupId(cid)
    if player_group_id > 1 and player_group_id ~= 8 and player_group_id ~= getPlayerStorageValue(cid, "group") then
        setPlayerStorageValue(cid, "group", player_group_id)
    end

    if player_group_id == 8 then
        if getPlayerStorageValue(cid, "group") ~= -1 then
            setPlayerGroupId(cid, getPlayerStorageValue(cid, "group"))
        else
            setPlayerGroupId(cid, 1)
        end
    end

    doCreatureSetNoMove(cid, false)
    doPlayerFormula(cid)

    -- Storages
    setPlayerStorageValue(cid, "dodge_special", 0)
    setPlayerStorageValue(cid, "disable_gate_expertise", -1)
    if getPlayerStorageValue(cid, "extra_life") == -1 then
        setPlayerStorageValue(cid, "extra_life", 0)
    end
    return true
end
