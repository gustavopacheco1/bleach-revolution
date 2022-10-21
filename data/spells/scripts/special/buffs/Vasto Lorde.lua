local spell = {
	cooldown = 30,
	duration = 15,
	outfit = 7,
	effect = 669
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_EFFECT, spell.effect)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, spell.duration * 1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, 5)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, 5)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, 5)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, 5)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	if isInSpecialCooldown(cid) then
		return false
	end

	doSetCreatureOutfit(cid, { lookType = spell.outfit }, spell.duration * 1000)
	exhaustion.set(cid, "special", spell.cooldown)
	doCombat(cid, combat, var)
	return true
end
