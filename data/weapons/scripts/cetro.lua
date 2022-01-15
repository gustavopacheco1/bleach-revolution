local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 17)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 115)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10.3, 1, -88.3, 1)

local critical = createCombatObject()
setCombatParam(critical, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(critical, COMBAT_PARAM_DISTANCEEFFECT, 115)
setCombatFormula(critical, COMBAT_FORMULA_LEVELMAGIC, -60.3, 1, -118.3, 1)

local outfit = {lookType = 458}

function onUseWeapon(cid, var)
	if not isPlayer(cid) then
		return false
end
	
	if isInArray( 1, getPlayerVocation(cid)) then
	doSetCreatureOutfit(cid, outfit)
	doSendAnimatedText(getPlayerPosition(cid),"- SAMEHADA -", math.random(1,69))
	doCombat(cid, combat, var)
	else
	doPlayerAddMana(cid, mana)
	doPlayerSendCancel(cid, "Sorry but there is someone in there! please wait.")
	end