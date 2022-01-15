function onKill(cid, target, lastHit)

if isPlayer(target) then
    doBroadcastMessage("O jogador ".. getCreatureName(cid) .." [".. getPlayerLevel(cid) .."]  acabou de matar o jogador -> " .. getCreatureName(target) .. " [".. getPlayerLevel(target) .."]!", MESSAGE_STATUS_CONSOLE_ORANGE) 
end
return TRUE
end