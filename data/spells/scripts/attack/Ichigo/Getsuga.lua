local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -66.0, 0, -81.0, 0)

function onCastSpell(cid, var)
    if exhaustion.check(cid, 300) then
        doPlayerSendCancel(cid, "You are exhausted.")
        return false
    end

    if hasCreatureCondition(cid, CONDITION_ATTRIBUTES) then
        CustomSpell.randomShoot(
            cid,
            combat,
            4,
            300,
            76,
            { id = 699, x = 0, y = 0 }
        )
    else
        CustomSpell.randomShoot(
            cid,
            combat,
            4,
            300,
            6,
            { id = 484, x = 0, y = 0 }
        )
    end

    exhaustion.set(cid, 300, 3)
    return true
end
