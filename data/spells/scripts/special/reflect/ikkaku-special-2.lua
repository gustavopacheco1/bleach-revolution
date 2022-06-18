local spell = {
    cooldown = 50,
    total_hits = 10,
    effect = 3
}

function onCastSpell(cid, var)
    if checkSpecialCooldown(cid) then
        return false
    end

    local player_position = getCreaturePosition(cid)
    doSendMagicEffect({
        x = player_position.x + 1,
        y = player_position.y + 1,
        z = player_position.z,
    }, spell.effect)

    setPlayerStorageValue(cid, "physical_protection", spell.total_hits)
    registerCreatureEvent(cid, "PhysicalProtection")

    exhaustion.set(cid, "special", spell.cooldown)
    return true
end
