local spell = {
    cooldown = 20,
    total_hits = 5, -- Numero de hits que a spell irá refletir
}

function onCastSpell(cid, var)
    if exhaustion.check(cid, "special") then
        doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") .. "s")
        return false
    end

    registerCreatureEvent(cid, "ReflectSooZabimaru")
    setPlayerStorageValue(cid, "reflect", spell.total_hits)
    exhaustion.set(cid, "special", spell.cooldown)
    return true
end
