local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 4)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -15.0, 0, -15.0, 0)

local function onCastSpell1(parameters)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end
local function onCastSpell2(parameters)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end
 
function onCastSpell(cid, var)
local waittime = 1.5 -- Tempo de exhaustion
local storage = 45670 -- nÃ£o mecha

if exhaustion.check(cid, storage) then
    doPlayerSendCancel(cid, "Aguarde "..(exhaustion.get(cid, storage)).." segundos(s) para usar novamente.")
	return false
end

local parameters = {cid = cid, var = var, combat1 = combat1}


for k = 1, 5 do
	addEvent(function()
		if isCreature(cid) then
			addEvent(onCastSpell1, 0, parameters)
		end
	end, 1 + ((k-1) * 275))
end
exhaustion.set(cid, storage, waittime)
return true
end