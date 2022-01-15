local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_DRAGONHEAD)
 
local condition = createConditionObject(CONDITION_FIRE)
setConditionParam(condition, CONDITION_PARAM_MINVALUE, 3500)
setConditionParam(condition, CONDITION_PARAM_MAXVALUE, 3500)
setConditionParam(condition, CONDITION_PARAM_STARTVALUE, 3500)
setConditionParam(condition, CONDITION_PARAM_TICKINTERVAL, 10*1)
setCombatCondition(combat, condition)
 
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if isInArray( 1, getPlayerVocation(cid)) then
	    doRemoveCondition(cid, condition)
	    doRemoveCondition(cid, CONDITION_FIRE)
		else 
		doAddCondition(cid, condition)
        doSendMagicEffect(getThingPos(cid), 1)
        end	
    return true
end
 
function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if (isPlayer(cid)) then
        doSendMagicEffect(getThingPos(cid), 1)
	    doRemoveCondition(cid, condition)
        end
    return true
end