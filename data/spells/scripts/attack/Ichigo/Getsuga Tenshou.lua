local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 81)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -20.0, 0, -20.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 200) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	for i = 1, 1 do
		addEvent(function()
			if isCreature(cid) then
				local target_position = getCreaturePosition(getCreatureTarget(cid))
				doSendMagicEffect({
					x = target_position.x + 1,
					y = target_position.y + 1,
					z = target_position.z
				}, 174)

				doCombat(cid, combat, var)
			end
		end, i * 275)
	end

	exhaustion.set(cid, 200, 2)
	return true
end
