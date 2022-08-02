local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 23)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -67.0, 0, -82.0, 0)

function onCastSpell(cid, var)
    if exhaustion.check(cid, 200) then
        doPlayerSendCancel(cid, "You are exhausted.")
        return false
    end

    if hasCreatureCondition(cid, CONDITION_ATTRIBUTES) then
        CustomSpell.skyShoot(
            cid,
            combat,
            4,
            300,
            91,
            { id = 227, x = 1, y = 1 }
        )
    else
        CustomSpell.randomEffect(
            cid,
            combat,
            4,
            300,
            23,
            { id = 466, x = 1, y = 1 }
        )
    end

    exhaustion.set(cid, 200, 2)
    return true
end
