local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 89)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -42.0, 0, -42.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 200) then
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
							x = target_position.x + 2,
							y = target_position.y + 2,
							z = target_position.z
						}, 740)

						doCombat(cid, combat, numberToVariant(target))
					end
				end
			end
		end, i * 300)
	end

	exhaustion.set(cid, 200, 2)
	return true
end
