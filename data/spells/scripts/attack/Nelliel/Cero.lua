local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 16)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 487)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -51.0, 0, -51.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 200) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	for i = 0, 4 do
		addEvent(function()
			if isCreature(cid) then
				doCombat(cid, combat, var)
			end
		end, i * 300)
	end

	exhaustion.set(cid, 200, 2)
	return true
end
