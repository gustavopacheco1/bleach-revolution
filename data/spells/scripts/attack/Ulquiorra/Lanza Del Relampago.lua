local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -47.0, 0, -47.0, 0)

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -50.0, 0, -65.0, 0)

function onCastSpell(cid, var)
        CustomSpell.randomShoot(
            cid,
            combat,
            4,
            300,
            64,
            { id = 6, x = 0, y = 0 }
        )
    end
    return true
end
