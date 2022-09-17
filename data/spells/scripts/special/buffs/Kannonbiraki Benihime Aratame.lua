local spell = {
	cooldown = 120,
	duration = 60,
	outfit = { first = 345, second = 344 },
	effect = 141
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, spell.duration * 1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, 10)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, 5)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	if isInSpecialCooldown(cid) then
		return false
	end

	local player_position = getCreaturePosition(cid)
	doSendMagicEffect({
		x = player_position.x + 1,
		y = player_position.y + 1,
		z = player_position.z,
	}, spell.effect)

	local half_duration = (spell.duration * 1000) / 2
	doSetCreatureOutfit(cid, { lookType = spell.outfit.first }, half_duration)
	addEvent(doSetCreatureOutfit, half_duration, cid, { lookType = spell.outfit.first }, half_duration)

	exhaustion.set(cid, "special", spell.cooldown)
	doCombat(cid, combat, var)
	return true
end
