local spell = {
	cooldown = 50,
	duration = 30,
	outfit = 379,
	effect = 600
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, spell.duration * 1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, 5)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, 5)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, 25)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	if isInSpecialCooldown(cid) then
		return false
	end

	local player_position = getCreaturePosition(cid)
	doSendMagicEffect({
		x = player_position.x + 2,
		y = player_position.y,
		z = player_position.z,
	}, spell.effect)

	doSetCreatureOutfit(cid, { lookType = spell.outfit }, spell.duration * 1000)
	exhaustion.set(cid, "special", spell.cooldown)
	doCombat(cid, combat, var)
	return true
end
