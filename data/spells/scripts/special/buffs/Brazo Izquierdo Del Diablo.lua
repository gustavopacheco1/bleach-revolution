local spell = {
	cooldown = 50,
	duration = 15,
	dodge_percentage = 50,
	effect = 658
}

local combat = createCombatObject()
local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, spell.duration * 1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	if isInSpecialCooldown(cid) then
		return false
	end

	local player_position = getCreaturePosition(cid)
	doSendMagicEffect({
		x = player_position.x,
		y = player_position.y,
		z = player_position.z
	}, spell.effect)

	setPlayerStorageValue(cid, "dodge_special", spell.dodge_percentage)
	addEvent(function()
		if isCreature(cid) then
			setPlayerStorageValue(cid, "dodge_special", 0)
		end
	end, spell.duration * 1000)
	exhaustion.set(cid, "special", spell.cooldown)
	doCombat(cid, combat, var)
	return true
end
