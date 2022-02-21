function onDeath(cid, corpse, deathList)
    for _, player in pairs(deathList) do
        setPlayerStorageValue(player, "tessai_quest", 1)
        doTeleportThing(player, {x = 3583, y = 3456, z = 8})
        doSendMagicEffect({x = 3583, y = 3456, z = 8}, 10)
    end
    return true
end
