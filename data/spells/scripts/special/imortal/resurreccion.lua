local spell = {
    duration = 10,
    cooldown = 60
}

function onCastSpell(cid, var)
    if exhaustion.check(cid, "special") then
        doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") .. "s")
        return false
    end

    setPlayerStorageValue(cid, "imortal", 1)
    doCreatureSetNoMove(cid, true)

    addEvent(function()
        if isCreature(cid) then
            setPlayerStorageValue(cid, "imortal", -1)
            doCreatureSetNoMove(cid, false)
        end
    end, spell.duration * 1000)

    exhaustion.set(cid, "special", spell.cooldown)
    return true
end