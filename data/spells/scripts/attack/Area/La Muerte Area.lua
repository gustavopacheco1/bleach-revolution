local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -325.0, 0, -335.0, 0)

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 627)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 627)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 627)

local combat4 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 627)

local area_damage = {
    {0, 0, 0, 0, 1, 0, 0, 0, 0,},
    {0, 0, 0, 1, 1, 1, 0, 0, 0,},
    {0, 0, 1, 1, 1, 1, 1, 0, 0,},
    {0, 1, 1, 1, 1, 1, 1, 1, 0,},
    {1, 1, 1, 1, 2, 1, 1, 1, 1,},
    {0, 1, 1, 1, 1, 1, 1, 1, 0,},
    {0, 0, 1, 1, 1, 1, 1, 0, 0,},
    {0, 0, 0, 1, 1, 1, 0, 0, 0,},
    {0, 0, 0, 0, 1, 0, 0, 0, 0,},
    {0, 0, 0, 0, 0, 0, 0, 0, 0,},
}

local area_1 = {
    {0, 1, 0},
    {1, 2, 1},
    {0, 1, 0},
}

local area_2 = {
    {0, 0, 1, 0, 0},
    {0, 1, 0, 1, 0},
    {1, 0, 2, 0, 1},
    {0, 1, 0, 1, 0},
    {0, 0, 1, 0, 0},
}

local area_3 = {
    {0, 0, 0, 1, 0, 0, 0},
    {0, 0, 1, 0, 1, 0, 0},
    {0, 1, 0, 0, 0, 1, 0},
    {1, 0, 0, 2, 0, 0, 1},
    {0, 1, 0, 0, 0, 1, 0},
    {0, 0, 1, 0, 1, 0, 0},
    {0, 0, 0, 1, 0, 0, 0},
}

local area_4 = {
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 1, 0, 1, 0, 0, 0},
    {0, 0, 1, 0, 0, 0, 1, 0, 0},
    {0, 1, 0, 0, 0, 0, 0, 1, 0},
    {1, 0, 0, 0, 2, 0, 0, 0, 1},
    {0, 1, 0, 0, 0, 0, 0, 1, 0},
    {0, 0, 1, 0, 0, 0, 1, 0, 0},
    {0, 0, 0, 1, 0, 1, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
}

setCombatArea(combat, createCombatArea(area_damage))
setCombatArea(combat1, createCombatArea(area_1))
setCombatArea(combat2, createCombatArea(area_2))
setCombatArea(combat3, createCombatArea(area_3))
setCombatArea(combat4, createCombatArea(area_4))

function onCastSpell(cid, var)
    doCombat(cid, combat, var)
    doCombat(cid, combat1, var)

    addEvent(function()
        doCombat(cid, combat2, var)
    end, 150)

    addEvent(function()
        doCombat(cid, combat3, var)
    end, 300)

    addEvent(function()
        doCombat(cid, combat4, var)
    end, 450)
    return true
end
