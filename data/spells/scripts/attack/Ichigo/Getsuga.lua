local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
onGetFormulaValues = getFiveShootsFormula
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
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

    return true
end
