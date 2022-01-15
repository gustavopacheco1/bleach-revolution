function onSay(cid, words, param, channel)
    if getPlayerStorageValue(cid, 380121) < os.time() then
        doPlayerSendCancel(cid, "O tempo para aceitar ja acabou.")
        return true
    end
    
    doPlayerSetStorageValue(cid, 125023, 1)
    doPlayerSendTextMessage(cid, 25, "Voce aceitou ser teleportado! Daqui a " .. getPlayerStorageValue(cid, 380121) - os.time() .. " voce vai ser teleportado.")
    return true
end