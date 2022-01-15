local condition = createConditionObject(CONDITION_MUTED)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000*10000) -- 10000*10000 Significa 10000 Segundos.
function onSay(cid, words, param)
local player = getPlayerByName(param)
if not player then doPlayerSendCancel(cid, "o Player "..param.." nao esta Online ou nao existe.") return true end
doAddCondition(player, condition)
return true end