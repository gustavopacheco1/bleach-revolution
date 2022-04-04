local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 69)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -17.0, 0, -17.0, 0)

function onCastSpell(cid, var)
    if exhaustion.check(cid, 45670) then
        doPlayerSendCancel(cid, "You are exhausted.")
        return false
    end

    for i = 1, 1 do
        addEvent(function()
            if isCreature(cid) then
				local target_position = getCreaturePosition(getCreatureTarget(cid))
                doSendMagicEffect({
                    x = target_position.x + 2,
                    y = target_position.y + 2,
                    z = target_position.z
                }, 551)

				doCombat(cid, combat, var)
            end
        end, i * 275)
    end
	
    exhaustion.set(cid, 45670, 1)
    return true
end
