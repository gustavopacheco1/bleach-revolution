local bosses = {
    ["Samurai Boss"] = {teleport_to = {x = 3330, y = 3627, z = 8}},
    ["Kensei Boss"] = {teleport_to = {x = 3889, y = 3414, z = 6}},
    ["Especial Hollow Snake"] = {teleport_to = {x = 3228, y = 3207, z = 8}},
    ["Barragan Boss"] = {teleport_to = {x = 4284, y = 3417, z = 6}},
    ["Legendary Grand Fisher"] = {storage = "tessai_quest", teleport_to = {x = 3583, y = 3456, z = 8}},
    ["Zaraki Legendary"] = {teleport_to = {x = 2769, y = 3937, z = 4}},
    ["Arrancar Boss"] = {teleport_to = {x = 3651, y = 4230, z = 8}},
    ["Ryu Boss"] = {teleport_to = {x = 3934, y = 3816, z = 8}},
    ["Hiroshi Boss"] = {teleport_to = {x = 2789, y = 3234, z = 6}},
    ["Hiroshi Boss Two"] = {teleport_to = {x = 2789, y = 3294, z = 6}}
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
