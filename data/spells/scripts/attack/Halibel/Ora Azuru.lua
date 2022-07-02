local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 74)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -16.0, 0, -16.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 45670) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	for i = 0, 4 do
		addEvent(function()
			if isCreature(cid) then
				local target = getCreatureTarget(cid)

				if isCreature(target) then
					local target_position = getCreaturePosition(target)

					if isSightClear(getCreaturePosition(cid), target_position, false) then
						doSendMagicEffect({
							x = target_position.x + 1,
							y = target_position.y + 1,
							z = target_position.z
						}, 460)

						doCombat(cid, combat, numberToVariant(target))
					end
				end
			end
		end, i * 275)
	end

	exhaustion.set(cid, 45670, 1)
	return true
end
