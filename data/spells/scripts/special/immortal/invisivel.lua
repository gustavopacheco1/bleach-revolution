local spell = {
    duration = 10,
    cooldown = 60
}

function onCastSpell(cid, var)
    if exhaustion.check(cid, "special") then
        doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") .. "s")
        return false
    end

    doCreatureExecuteTalkAction(cid, "###invisible", true)
    doSetCreatureOutfit(cid, {lookType = 0}, (spell.duration - 0.25) * 1000)
    setCreatureTarget(cid, nil)
    
	registerCreatureEvent(cid, "InvisibleSpellStats")
	registerCreatureEvent(cid, "InvisibleSpellAttack")
	registerCreatureEvent(cid, "InvisibleSpellTarget")

    addEvent(function()
        if isCreature(cid) then
            doCreatureExecuteTalkAction(cid, "###invisible", true)
            unregisterCreatureEvent(cid, "InvisibleSpellStats")
	        unregisterCreatureEvent(cid, "InvisibleSpellAttack")
	        unregisterCreatureEvent(cid, "InvisibleSpellTarget")
        end
    end, spell.duration * 1000)

    exhaustion.set(cid, "special", spell.cooldown)
    return true
end
