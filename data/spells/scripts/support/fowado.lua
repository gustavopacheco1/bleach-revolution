local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 14)

local area = createCombatArea({
	{ 1, 1, 1 },
	{ 1, 3, 1 },
	{ 1, 1, 1 },
})
setCombatArea(combat, area)

function onTarget(cid, target)
	return doChallengeCreature(cid, target)
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETCREATURE, "onTarget")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
