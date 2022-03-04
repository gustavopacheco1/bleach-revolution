local bosses = {
    ["Samurai Boss"] = {teleport_to = {x = 3330, y = 3627, z = 8}},
    ["Kensei Boss"] = {teleport_to = {x = 3889, y = 3414, z = 6}},
    ["Especial Hollow Snake"] = {teleport_to = {x = 3228, y = 3207, z = 8}},
    ["Barragan Boss"] = {teleport_to = {x = 4284, y = 3417, z = 6}},
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
