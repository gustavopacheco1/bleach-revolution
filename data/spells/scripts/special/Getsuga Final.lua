local spell = {
    multiplier = 0.4, -- 0.3 = 30%, 0.4 = 40%...
    cooldown = 50
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 76)

function onCastSpell(cid, var)
    if exhaustion.check(cid, "special") then
        doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") .. "s")
        return false
    end

    local target = getCreatureTarget(cid)
    local target_position = getCreaturePosition(target)
    doSendMagicEffect({
        x = target_position.x,
        y = target_position.y,
        z = target_position.z
    }, 699)

    local damage = -getCreatureMaxHealth(cid) * spell.multiplier
    doTargetCombatHealth(cid, target, COMBAT_PHYSICALDAMAGE, damage, damage, false)
	doCreatureAddHealth(cid, damage, false, COLOR_RED)
    
    exhaustion.set(cid, "special", spell.cooldown)
    doCombat(cid, combat, var)
    return true
end
