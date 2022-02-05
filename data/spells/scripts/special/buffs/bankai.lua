local spell = {
    cooldown = 80,
    duration = 30,
    outfit = 127,
    effect = 3
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, spell.duration * 1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, 10)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, 10)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, 10)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, 10)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
    if exhaustion.check(cid, "special") then
        doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") .. "s")
        return false
    end

    local player_position = getCreaturePosition(cid)
    doSendMagicEffect({
        x = player_position.x + 1,
        y = player_position.y + 1,
        z = player_position.z,
    }, spell.effect)

	doSetCreatureOutfit(cid, {lookType = spell.outfit}, spell.duration * 1000)
	exhaustion.set(cid, "special", spell.cooldown)
	doCombat(cid, combat, var)
    return true
end