local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -66.0, 0, -66.0, 0)

function onCastSpell(cid, var)
    if exhaustion.check(cid, 200) then
        doPlayerSendCancel(cid, "You are exhausted.")
        return false
    end

    if hasCreatureCondition(cid, CONDITION_ATTRIBUTES) then
        CustomSpell.skyShoot(
            cid,
            combat,
            1,
            300,
            81,
            { id = 411, x = 1, y = 1 }
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

    exhaustion.set(cid, 200, 2)
    return true
end
