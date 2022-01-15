local config = {
    boss = "[MvP] Kyuubi",
    msg = "O teleport irá sumir em dois minutos.",
}

function onKill(cid, target)
    if(isMonster(target) and string.lower(getCreatureName(target)) == config.boss) then
        broadcastMessage(config.msg, TALKTYPE_ORANGE_1)
    end
    return true
end