local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -120.0, 0, -120.0, 0)

function onCastSpell(cid, var)
    if exhaustion.check(cid, 270) then
        doPlayerSendCancel(cid, "You are exhausted.")
        return false
    end

    if hasCreatureCondition(cid, CONDITION_ATTRIBUTES) then
        CustomSpell.randomShoot(
            cid,
            combat,
            1,
            300,
            92,
            { id = 15, x = 0, y = 0 }
        )
    else
        CustomSpell.randomShoot(
            cid,
            combat,
            1,
            300,
            92,
            { id = 15, x = 0, y = 0 }
        )
    end

    exhaustion.set(cid, 270, 2)
    return true
end
