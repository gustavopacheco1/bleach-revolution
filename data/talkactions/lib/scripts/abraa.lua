local config = {
palavra = 'fuinjutsu', 
storage = 123146, -- Não mexa aqui! 
time = 5, -- tempo em segundos que será criada a parede 
pos = {x=801,y=1206,z=7},
pos2 = {x=799,y=1206,z=7},
paredeid = 3435, -- id da parede 
parede2id = 3651, -- id da parede
} 
local position = {
x = 799,y = 1207,z = 7 -- pos em que o jogador precisa estar para falar
} 
 
function onSay(cid, words, param, channel) 
function criar() 
doCreateItem(config.paredeid, 1, config.pos)
doCreateItem(config.parede2id, 1, config.pos2) 
end 
local parede = getTileItemById(config.pos, config.paredeid)
local parede2 = getTileItemById(config.pos2, config.parede2id) 
local pos,area = getCreaturePosition(cid)
local pos2,area = getCreaturePosition(cid) 
if (pos.z == position.z) and (pos.x == position.x) and (pos.y == position.y) and (pos2.z == position.z) and (pos2.x == position.x) and (pos2.y == position.y) then 
if words == config.palavra then
if parede and parede2 then
if getGlobalStorageValue(config.storage) <= os.time() then 
doRemoveItem(parede.uid, 1)
doRemoveItem(parede2.uid, 1) 
setGlobalStorageValue(config.storage,os.time()+config.time+5) 
addEvent(criar, config.time*1000)
else
doPlayerSendCancel(cid, "A entrada já foi removida.")
return TRUE
end
end
end
end
end