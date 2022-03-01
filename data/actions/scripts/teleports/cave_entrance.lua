function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getPlayerLevel(cid) < 100 then
        return MultiLanguage.doPlayerSendTextMessage(
            cid,
            MESSAGE_INFO_DESCR,
            "You need to be level 100 to pass.",
            "Você precisa ser nível 100 para passar."
        )
    end

    doTeleportThing(cid, {x = 3434, y = 3585, z = 8})
    return true
end
