local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_DARKPURPLE)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 43)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -15.0, 0, -20.0, 0)

function onCastSpell(cid, var)
	for i = 0, 1 do
		addEvent(function()
			if isCreature(cid) then
				doCombat(cid, combat, var)
			end
		end, i * 200)
	end
	return true
end
