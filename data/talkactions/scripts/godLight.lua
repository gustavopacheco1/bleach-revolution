local condition = createConditionObject(CONDITION_LIGHT)
setConditionParam(condition, CONDITION_PARAM_LIGHT_LEVEL, 13)
setConditionParam(condition, CONDITION_PARAM_LIGHT_COLOR, 215)
setConditionParam(condition, CONDITION_PARAM_TICKS, -1)

function onSay(cid, words, param)
if getPlayerStorageValue(cid, 54448) ~= 1 then
doAddCondition(cid, condition)
setPlayerStorageValue(cid, 54448, 1)
else
doRemoveCondition(cid, CONDITION_LIGHT)
setPlayerStorageValue(cid, 54448, 0)
end
return TRUE
end
