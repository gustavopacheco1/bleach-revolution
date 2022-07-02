local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 5)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

function getCombatFormulas(cid, level, magicLevel)
	local min = (level * 70)
	local max = (level * 140)

	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulas")

function onCastSpell(cid, var)
	if exhaustion.check(cid, 13301) then
		doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, 13301) .. "s")
		return false
	end

	exhaustion.set(cid, 13301, 4.0)
	doCombat(cid, combat, var)
	return true
end
