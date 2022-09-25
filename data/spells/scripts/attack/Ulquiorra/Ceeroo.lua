local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -60.0, 0, -75.0, 0)

function onCastSpell(cid, var)
    if exhaustion.check(cid, 200) then
        doPlayerSendCancel(cid, "You are exhausted.")
        return false
    end

    if hasCreatureCondition(cid, CONDITION_ATTRIBUTES) then
        CustomSpell.randomShoot(
            cid,
            combat,
            1,
            300,
            90,
            { id = 733, x = 1, y = 1 }
        )
    else
        CustomSpell.randomShoot(
            cid,
            combat,
            1,
            300,
            93,
            { id = 748, x = 0, y = 0 }
        )
    end

    exhaustion.set(cid, 200, 2)
    return true
end
