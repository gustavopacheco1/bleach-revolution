local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, COMBAT_MANADRAIN)
 
local condition = createConditionObject(CONDITION_POISON)
setConditionParam(condition, CONDITION_PARAM_MINVALUE, 3500)
setConditionParam(condition, CONDITION_PARAM_MAXVALUE, 3500)
setConditionParam(condition, CONDITION_PARAM_STARTVALUE, 3500)
setConditionParam(condition, CONDITION_PARAM_TICKINTERVAL, 10*1)
setCombatCondition(combat, condition)
 
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if (isPlayer(cid)) then
        doAddCondition(cid, condition)
        doSendMagicEffect(getThingPos(cid), 229)
        end
    return true
end
 
function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if (isPlayer(cid)) then
	    doRemoveCondition(cid, condition)
        end
    return true
end