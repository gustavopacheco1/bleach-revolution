local bosses = {
    ["Legendary Grand Fisher"] = {storage = "tessai_quest", teleport_to = {x = 3583, y = 3456, z = 8}},
    ["Zaraki Legendary"] = {teleport_to = {x = 2769, y = 3941, z = 4}}
}

function onDeath(cid, corpse, deathList)
    local boss = bosses[getCreatureName(cid)]

    for _, player in pairs(deathList) do
        if boss.storage then
            setPlayerStorageValue(player, boss.storage, 1)
        end

        doTeleportThing(player, boss.teleport_to)
        doSendMagicEffect(boss.teleport_to, 10)
    end
    
    return true
end
