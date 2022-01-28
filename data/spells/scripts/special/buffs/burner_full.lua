local spell = {
    cooldown = 80,
    duration = 30,
    outfit = 152,
    effect = 441
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_EFFECT, spell.effect)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, spell.duration * 1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, 10)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, 10)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, 10)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
    if exhaustion.check(cid, "special") then
        doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") .. "s")
        return false
    end

	doSetCreatureOutfit(cid, {lookType = spell.outfit}, spell.duration * 1000)
	exhaustion.set(cid, "special", spell.cooldown)
	doCombat(cid, combat, var)
    return true
end
