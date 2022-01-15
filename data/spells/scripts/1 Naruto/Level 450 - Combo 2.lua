local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_RED)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -50.2, 1, -65.8, 1)

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -91.1, 1, -99.2, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -18.2, 1, -9.2, 1)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -18.2, 1, -1.1, 1)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -18.2, 1, -9.2, 1)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
	end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
	end

local function onCastSpell3(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat3, parameters.var)
	end

local function onCastSpell4(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat4, parameters.var)
	end

function onCastSpell(cid, var)
	local waittime = 1.0 -- Tempo de exhaustion
	local storage = 115819
		if exhaustion.check(cid, storage) then
		return false
	end
	local effect = 25
	local PosTarget = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}	
	local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}	
	local position2 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
	local position3 = {x=getThingPosition(getCreatureTarget(cid)).x-1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
	local position4 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
	local position5 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
	local parameters = { cid = cid, var = var}
	doCreatureSay(cid, "Explosion Rasen Ball", TALKTYPE_MONSTER)
	doSendMagicEffect(PosTarget, effect)
	doSendMagicEffect(position5, 231)
	doSendMagicEffect(position1, 177)
	doSendMagicEffect(position2, 25)
	doSendMagicEffect(position3, 25)
	doSendMagicEffect(position4, 25)
	addEvent(onCastSpell1, 100, parameters)
	addEvent(onCastSpell2, 150, parameters)
	addEvent(onCastSpell2, 200, parameters)
	addEvent(onCastSpell2, 250, parameters)
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid, combat, var)
end
