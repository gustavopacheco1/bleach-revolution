local conditionBlack = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionBlack, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionBlack, {lookType = 264, lookHead = 114, lookBody = 114, lookLegs = 114, lookFeet = 114})
local conditionRed = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionRed, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionRed, {lookType = 213, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94})
function onStepIn(cid, item, position, fromPosition)
if getPlayerAccess(cid) > 3 then
doTeleportThing(cid, _Lib_Battle_Info.TeamOne.pos) return false
elseif getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
setGlobalStorageValue(_Lib_Battle_Info.storage_count, getGlobalStorageValue(_Lib_Battle_Info.storage_count)-1)
end
if getGlobalStorageValue(_Lib_Battle_Info.storage_count) >= 0 then
if getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) < getGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage) then
setPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage, 1)
doAddCondition(cid, conditionBlack)
setGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage, getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage)+1)
doTeleportThing(cid, _Lib_Battle_Info.TeamOne.pos)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce entrou no Time " .. _Lib_Battle_Info.TeamOne.name .. "!")
else
setPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage, 1)
doAddCondition(cid, conditionRed)
setGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage, getGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage)+1)
doTeleportThing(cid, _Lib_Battle_Info.TeamTwo.pos)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce entrou no Time " .. _Lib_Battle_Info.TeamTwo.name .. "!")
end
end
if getGlobalStorageValue(_Lib_Battle_Info.storage_count) == 0 then
removeBattleTp()
doBroadcastMessage("A batalha da Guerra Ninja vai iniciar em 1 minuto, monte sua estrategia para ganhar o evento!")
addEvent(doBroadcastMessage, 1*60*1000-500, "Guerra Ninja Iniciada!")
addEvent(OpenWallBattle, 1*60*1000)
end
return true
end