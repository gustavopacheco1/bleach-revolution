local spell = {
	cooldown = 50,
	duration = 30,
	effect = 462,
	outfit = 438
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, spell.duration * 1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, 15)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, 20)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, 30)
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

	exhaustion.set(cid, "special", spell.cooldown)
	doSetCreatureOutfit(cid, { lookType = spell.outfit }, spell.duration * 1000)
	doCombat(cid, combat, var)
	return true
end
