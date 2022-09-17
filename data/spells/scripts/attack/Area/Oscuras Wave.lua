local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -85.0, 0, -100.0, 0)
setCombatArea(combat, createCombatArea(AREA_CIRCLE3X3_FULL))

local area1 = createCombatObject()
setCombatParam(area1, COMBAT_PARAM_EFFECT, 649)
setCombatArea(area1, createCombatArea(AREA_CIRCLE3X3_FIRST))

local area2 = createCombatObject()
setCombatParam(area2, COMBAT_PARAM_EFFECT, 649)
setCombatArea(area2, createCombatArea(AREA_CIRCLE3X3_SECOND))

local area3 = createCombatObject()
setCombatParam(area3, COMBAT_PARAM_EFFECT, 649)
setCombatArea(area3, createCombatArea(AREA_CIRCLE3X3_THIRD))

function onCastSpell(cid, var)
	-- Damage
	doCombat(cid, combat, var)

	-- Effects
	doCombat(cid, area1, var)
	addEvent(doCombat, 75, cid, area2, var)
	addEvent(doCombat, 150, cid, area3, var)
	return true
end
