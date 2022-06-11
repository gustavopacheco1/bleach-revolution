local teleports = {
    [20000] = { position = { x = 3587, y = 3463, z = 8 } },
    [20001] = { position = { x = 3434, y = 3585, z = 8 }, level = 100 },
    [20002] = { position = { x = 2434, y = 3391, z = 7 }, level = 350 },
    [20003] = { position = { x = 2433, y = 3395, z = 7 }, level = 350 },
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local teleport = teleports[getItemAttribute(item.uid, "uid")]

    if teleport.level then
        if getPlayerLevel(cid) < teleport.level then
            return MultiLanguage.doPlayerSendTextMessage(
                cid,
                MESSAGE_INFO_DESCR,
                "You need to be level " .. teleport.level .. " to pass.",
                "Você precisa ser nível " .. teleport.level .. " para passar."
            )
        end
    end

    if teleport.effect then
        doSendMagicEffect(teleport.position, teleport.effect)
    end
    doTeleportThing(cid, teleport.position)
    return true
end
