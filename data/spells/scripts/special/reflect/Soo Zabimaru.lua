local config = {
    storage = 318210, -- storage que salva o tempo da spell
    storagecol = 3482101, -- storage que salva o tempo entre 1 uso e outro
    cooldown = 80, -- tempo de um uso e outro
    duration = 5, -- tempo que a spell dura
    effect1 = 535 --- efeito que sai qnd usa a spell
}

function onCastSpell(cid, var)
    if getPlayerStorageValue(cid, config.storage) - os.time() > 0 then
        doPlayerSendCancel(cid, "Você está protegido pela Zabimaru !")
        return false
    end
    if os.time() - getPlayerStorageValue(cid, config.storagecol) >= config.cooldown then
        setPlayerStorageValue(cid, config.storagecol, os.time())
        doSendMagicEffect(getCreaturePosition(cid), config.effect1)
        setPlayerStorageValue(cid, config.storage, os.time() + config.duration)
        doPlayerSendTextMessage(cid, 27, "Você ativou o modo Reflect Zaabimaru e nos próximos " .. config.duration .. " segundos refletirá danos.")
    else
        doPlayerSendCancel(cid, "Você está cansado, precisa aguardar " .. (config.cooldown - (os.time() - getPlayerStorageValue(cid, config.storagecol))) .. " segundos.")
        return false
    end
    return true
end
