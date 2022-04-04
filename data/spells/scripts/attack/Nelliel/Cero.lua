local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 16)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 487)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -11.0, 0, -11.0, 0)

function onCastSpell(cid, var)
    if exhaustion.check(cid, 45670) then
        doPlayerSendCancel(cid, "You are exhausted.")
        return false
    end

    for i = 0, 4 do
        addEvent(function()
            if isCreature(cid) then
				doCombat(cid, combat, var)
            end
        end, i * 275)
    end

    exhaustion.set(cid, 45670, 1)
    return true
end
