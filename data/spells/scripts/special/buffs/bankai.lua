local spell = {
    cooldown = 80, -- tempo em segundos de 1 uso e outro
    duration = 30, -- tempo que vai durar a spell (em segundos)
    outfit = 127, -- outfit que o player ira ter
    effect = 3 -- efeito que sai ao castar a spell
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, spell.effect)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, spell.duration * 1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, 10)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, 10)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, 10)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, 10)
setConditionParam(condition, CONDITION_PARAM_OUTFIT, spell.outfit)
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
