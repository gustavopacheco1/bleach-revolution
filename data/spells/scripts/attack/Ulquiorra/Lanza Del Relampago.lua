local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -47.0, 0, -47.0, 0)

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -47.0, 0, -62.0, 0)

function onCastSpell(cid, var)
    if exhaustion.check(cid, 100) then
        doPlayerSendCancel(cid, "You are exhausted.")
        return false
    end

    if hasCreatureCondition(cid, CONDITION_ATTRIBUTES) then
        CustomSpell.randomShoot(
            cid,
            combat,
            4,
            300,
            0,
            { id = 0, x = 0, y = 0 }
        )
    else
        CustomSpell.randomShoot(
            cid,
            combat,
            4,
            300,
            64,
            { id = 6, x = 0, y = 0 }
        )
    end

    exhaustion.set(cid, 100, 1)
    return true
end
