local storage = 22196
local config = {
[1] = { 1, 1, 648, 2},
}

function onSay(cid, words, param, channel)

if getPlayerStorageValue(cid, storage) < 1 then
doPlayerSendCancel(cid, "Desculpe, mas para obter a proxima transformação, você necessita completar a saga pendente. Para saber, a tarefa de cada saga, utilize o comando !saga.")
return false
end

if exhaustion.check(cid, 100) == TRUE then
doPlayerSendCancel(cid, "Espere 1 segundos para se transformar denovo.")
doSendMagicEffect(getCreaturePosition(cid), 134)
return TRUE
end

local from1,to1 = {x=1475, y=856, z=7},{x=1484, y=867, z=7} -- trocar vocation
local from2,to2 = {x=984, y=578, z=7},{x=1044, y=652, z=7} -- shinobi war
local from3,to3 = {x=984, y=578, z=6},{x=1044, y=652, z=6} -- shinobi war
local from4,to4 = {x=984, y=578, z=5},{x=1044, y=652, z=5} -- shinobi war

if isInRange(getCreaturePosition(cid), from1, to1) or isInRange(getCreaturePosition(cid), from2, to2) or isInRange(getCreaturePosition(cid), from3, to3) or isInRange(getCreaturePosition(cid), from4, to4) then
doPlayerSendCancel(cid, "Voce nao pode se Transformar nesta area!")
return TRUE
end

local voc = config[getPlayerVocation(cid)]

if voc then
if getPlayerLevel(cid) >= voc[1] then
doCreatureSay(cid, "Transformar!", TALKTYPE_MONSTER)
doPlayerSetVocation(cid, voc[2])
local outfit = {lookType = voc[3]}
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), voc[4])
doRemoveCreature(uid)
setPlayerStorageValue(cid, 300, (getPlayerVocation(cid)))
exhaustion.set(cid, 120, 2.5)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce precisa estar no level " .. voc[1] .. " para transformar.")
end
else
doPlayerSendCancel(cid, "Voce ja esta na ultima transformaçao.!")
end
return true
end