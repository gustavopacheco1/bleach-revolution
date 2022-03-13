local spell = {
    duration = 10,
    cooldown = 60
}

function onCastSpell(cid, var)
    if exhaustion.check(cid, "special") then
        doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") .. "s")
        return false
    end

    local clone = doCreateMonster("Rukia Clone", getCreaturePosition(cid), false, true)
    doCreatureChangeOutfit(clone, getCreatureOutfit(cid))
    doCreatureSetLookDir(clone, getCreatureLookDir(cid))
    doCreatureSetHideHealth(clone, true)

    doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
    setPlayerGroupId(cid, 8)
    doCreatureExecuteTalkAction(cid, "###invisible", true)
    doSetCreatureOutfit(cid, {lookType = 0}, (spell.duration - 0.25) * 1000)
    setCreatureTarget(cid, nil)
    
    addEvent(function()
        if isCreature(cid) then
            doCreatureExecuteTalkAction(cid, "###invisible", true)
            setPlayerGroupId(cid, 1)
        end
        if isCreature(clone) then
            doSendMagicEffect(getCreaturePosition(clone), 2)
            doRemoveCreature(clone)
        end
    end, spell.duration * 1000)

    exhaustion.set(cid, "special", spell.cooldown)
    return true
end
