local config = {
    mount = {"on", "montar"},
    unmount = {"off", "desmontar"}
}
local outfit = {lookType = 372}
local condition = createConditionObject(CONDITION_HASTE)
  setConditionParam(condition, CONDITION_PARAM_TICKS, -1)
setConditionFormula(condition, 0.25, 0, 0.50, 0)
 
function onSay(cid, words, param, channel)
    param = param:lower()
if(table.isStrIn(param, config.mount)) then
   doSetCreatureOutfit(cid, outfit, -1) 
     doAddCondition(cid, condition)
   doSendMagicEffect(getPlayerPosition(cid),12)
elseif(table.isStrIn(param, config.unmount)) then
    doRemoveCondition(cid, CONDITION_OUTFIT)
      doRemoveCondition(cid, CONDITION_HASTE)
    doSendMagicEffect(getPlayerPosition(cid),67)
else
    doPlayerSendCancel(cid, "Parametro Inválido.")
    return true
 end
end