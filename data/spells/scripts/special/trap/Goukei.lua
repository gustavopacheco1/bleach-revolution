local spell = {
	cooldown = 30,
	duration = 3
}

local area = createCombatArea {
	{ 1, 1, 1 },
	{ 1, 2, 1 },
	{ 1, 1, 1 }
}

local combat_effect = createCombatObject()
setCombatArea(combat_effect, area)
setCombatParam(combat_effect, COMBAT_PARAM_EFFECT, 543)

local combat_damage = createCombatObject()
setCombatParam(combat_damage, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat_damage, COMBAT_FORMULA_LEVELMAGIC, -50.0, 0, -50.0, 0)
setCombatParam(combat_damage, COMBAT_PARAM_EFFECT, 543)

function onCastSpell(cid, var)
	if isInSpecialCooldown(cid) then
		return false
	end

	local target = getCreatureTarget(cid)

	if getCreatureNoMove(target) or getCreatureSpeed(target) == 0 then
		MultiLanguage.doPlayerSendCancel(
			cid,
			"You may not use a trap technique in a trapped creature.",
			"Você não pode utilizar uma técnica de trap em uma criatura trapada."
		)
		return false
	end

	if isPlayer(target) then
		doCreatureSetNoMove(target, true)
		addEvent(function()
			if isCreature(cid) then
				doCreatureSetNoMove(target, false)
				doCombat(cid, combat_damage, var)
			end
		end, spell.duration * 1000)
	end

	if isMonster(target) then
		local creature_base_speed = getCreatureBaseSpeed(target)

		doChangeSpeed(target, -getCreatureSpeed(target))
		addEvent(function()
			if isMonster(target) then
				doChangeSpeed(target, creature_base_speed)
				doCombat(cid, combat_damage, var)
			end
		end, spell.duration * 1000)
	end

	exhaustion.set(cid, "special", spell.cooldown)
	doCombat(cid, combat_effect, var)
	return true
end
