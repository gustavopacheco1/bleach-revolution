local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 36)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -60.0, 0, -60.0, 0)

function onCastSpell(cid, var)
    if exhaustion.check(cid, 120) then
        doPlayerSendCancel(cid, "You are exhausted.")
        return false
    end

    exhaustion.set(cid, 120, 1)
    return doCombat(cid, combat, var)
end
