local spell = {
	item = 10501,
	effect_item = 487,
	effect_buff = 487,
	missile = 16,
	cooldown = 30,
	duration = 10
}

local combat_buff = createCombatObject()
setCombatParam(combat_buff, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat_buff, COMBAT_PARAM_EFFECT, spell.effect_buff)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, spell.duration * 1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, 10)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, 10)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, 10)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, 10)
setCombatCondition(combat_buff, condition)

local combat = createCombatObject()
setCombatArea(combat, createCombatArea({
	{ 0, 0, 1, 1, 1, 1, 1, 0, 0 },
	{ 0, 1, 1, 0, 0, 0, 1, 1, 0 },
	{ 1, 1, 0, 0, 0, 0, 0, 1, 1 },
	{ 1, 0, 0, 0, 0, 0, 0, 0, 1 },
	{ 1, 0, 0, 0, 2, 0, 0, 0, 1 },
	{ 1, 0, 0, 0, 0, 0, 0, 0, 1 },
	{ 1, 1, 0, 0, 0, 0, 0, 1, 1 },
	{ 0, 1, 1, 0, 0, 0, 1, 1, 0 },
	{ 0, 0, 1, 1, 1, 1, 1, 0, 0 },
}))

function onTargetTile(cid, pos)
	if getTileThingByPos(pos).itemid ~= 0 then
		doSendDistanceShoot(getCreaturePosition(cid), pos, spell.missile)
		doSendMagicEffect({
			x = pos.x,
			y = pos.y,
			z = pos.z
		}, spell.effect_item)
		doCreateItem(spell.item, 1, pos)
		addEvent(function()
			local thing = getTileItemById(pos, spell.item).uid
			if thing ~= 0 then
				doRemoveItem(thing)
				doSendMagicEffect({
					x = pos.x,
					y = pos.y,
					z = pos.z
				}, spell.effect_item)
			end
		end, spell.duration * 1000)
	end
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
	if isInSpecialCooldown(cid) then
		return false
	end

	exhaustion.set(cid, "special", spell.cooldown)
	doCombat(cid, combat, var)
	doCombat(cid, combat_buff, var)
	return true
end
