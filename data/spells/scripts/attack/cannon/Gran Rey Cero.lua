local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatArea(combat, createCombatArea(AREA_BIG_CANNON_6SQM, AREADIAGONAL_BIG_CANNON_6SQM))
onGetFormulaValues = getCannonFormula
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local vocations_effects = {
	-- Nnoitra Gilga
	[21] = {
		east = 618,
		west = 618,
		north = 617,
		south = 617,
	},

	-- Grimmjow Jaegerjaquez
	[18] = {
		east = 758,
		west = 758,
		north = 757,
		south = 757,
	}
}

function onCastSpell(cid, var)
	if exhaustion.check(cid, "special") then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return false
	end

	local vocation_effects = vocations_effects[getPlayerVocation(cid)]

	doCannon(
		cid,
		combat,
		var,
		{ length = 6, height = 3 },
		{ east = vocation_effects.east, west = vocation_effects.west, north = vocation_effects.north, south = vocation_effects.south }
	)

	exhaustion.set(cid, "special", COOLDOWN_CANNON)
	return true
end
