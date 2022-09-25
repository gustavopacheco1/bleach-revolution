local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatArea(combat, createCombatArea(AREA_CIRCLE3X3_FULL))
onGetFormulaValues = getAreaFormula
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local area1 = createCombatObject()
setCombatParam(area1, COMBAT_PARAM_EFFECT, 583)
setCombatArea(area1, createCombatArea(AREA_CIRCLE3X3_FIRST_CENTER_X))

local area2 = createCombatObject()
setCombatParam(area2, COMBAT_PARAM_EFFECT, 583)
setCombatArea(area2, createCombatArea(AREA_CIRCLE3X3_SECOND_CENTER_X))

local area3 = createCombatObject()
setCombatParam(area3, COMBAT_PARAM_EFFECT, 583)
setCombatArea(area3, createCombatArea(AREA_CIRCLE3X3_THIRD_CENTER_X))

function onCastSpell(cid, var)
	-- Damage
	doCombat(cid, combat, var)

	-- Effects
	doCombat(cid, area1, var)
	addEvent(doCombat, 75, cid, area2, var)
	addEvent(doCombat, 150, cid, area3, var)
	return true
end
