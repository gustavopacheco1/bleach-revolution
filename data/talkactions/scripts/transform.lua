function onSay(cid, words, param, channel)
    if isInArray({"transform", "!transform", "transformar", "!transformar"}, words) then
        local player_vocation = getPlayerVocation(cid)
        local player_position = getCreaturePosition(cid)

        if not VOCATION_TRANSFORM[player_vocation] then
            MultiLanguage.doPlayerSendCancel(
                cid,
                "You cannot transform.",
                "Você não pode se transformar."
            )
            return true
        end

        if getPlayerLevel(cid) < VOCATION_TRANSFORM[player_vocation].level then
            MultiLanguage.doPlayerSendCancel(
                cid,
                "You need to be level " .. VOCATION_TRANSFORM[player_vocation].level .. " to transform.",
                "Você precisa ser level " .. VOCATION_TRANSFORM[player_vocation].level .. " para transformar."
            )
            return true
        end

        doPlayerSetVocation(cid, VOCATION_TRANSFORM[player_vocation].vocation)
        doCreatureChangeOutfit(cid, {lookType = VOCATION_TRANSFORM[player_vocation].looktype})
        if VOCATION_TRANSFORM[player_vocation].effect.x or VOCATION_TRANSFORM[player_vocation].effect.y then
            doSendMagicEffect({
                x = player_position.x + VOCATION_TRANSFORM[player_vocation].effect.x,
                y = player_position.y + VOCATION_TRANSFORM[player_vocation].effect.y,
                z = player_position.z
            }, VOCATION_TRANSFORM[player_vocation].effect.number)
        else
            doSendMagicEffect(player_position, VOCATION_TRANSFORM[player_vocation].effect.number)
        end
        return true
    end

    if isInArray({"revert", "!revert", "reverter", "!reverter"}, words) then
        local player_vocation_name = getPlayerVocationName(cid)
        local player_position = getCreaturePosition(cid)

        if getPlayerVocation(cid) == VOCATION_REVERT[player_vocation_name].vocation then
            MultiLanguage.doPlayerSendCancel(
                cid,
                "You've already reverted.",
                "Você já reverteu."
            )
            return true
        end

        doPlayerSetVocation(cid, VOCATION_REVERT[player_vocation_name].vocation)
        doCreatureChangeOutfit(cid, {lookType = VOCATION_REVERT[player_vocation_name].looktype})
        if VOCATION_REVERT[player_vocation_name].effect.x or VOCATION_REVERT[player_vocation_name].effect.y then
            doSendMagicEffect({
                x = player_position.x + VOCATION_REVERT[player_vocation_name].effect.x,
                y = player_position.y + VOCATION_REVERT[player_vocation_name].effect.y,
                z = player_position.z
            }, VOCATION_REVERT[player_vocation_name].effect.number)
        else
            doSendMagicEffect(player_position, VOCATION_REVERT[player_vocation_name].effect.number)
        end

        return true
    end
end
