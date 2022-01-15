function onDeath(cid, corpse, killer)
    if isPlayer(cid) and isPlayer(killer[1]) then
        local heart = doPlayerAddItem(killer[1], 5943, 1)
        doItemSetAttribute(heart, "Este coracao pertencia a "..getCreatureName(cid).." que morreu no level "..getPlayerLevel(cid).." e foi arrancado por "..getCreatureName(killer[1]).."")
    end
    return true
end