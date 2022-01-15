local config = {
palavra = '/ctftrap', 
storage = 121250, -- Não mexa aqui! 
time = 5,
pos = {x=1015,y=709,z=7},
pos2 = {x=1016,y=709,z=7},
pos3 = {x=1017,y=709,z=7},
pos4 = {x=1015,y=708,z=6},
pos5 = {x=1016,y=708,z=6},
pos6 = {x=1014,y=732,z=6},
pos7 = {x=1015,y=732,z=6},
pos8 = {x=1016,y=732,z=6},
pos9 = {x=1014,y=730,z=7},
pos10 = {x=1015,y=730,z=7},
pos11 = {x=1016,y=730,z=7},
paredeid = 9213, -- id da parede 
parede2id = 9213, -- id da parede
parede3id = 9213, -- id da parede
parede4id = 9213, -- id da parede
parede5id = 9213, -- id da parede
parede6id = 9213, -- id da parede
parede7id = 9213, -- id da parede
parede8id = 9213, -- id da parede
parede9id = 9213, -- id da parede
parede10id = 9213, -- id da parede
parede11id = 9213, -- id da parede
} 
local position = {
x = 1080,y = 713,z = 7 -- pos em que o jogador precisa estar para falar
} 
 
function onSay(cid, words, param, channel) 
local parede = getTileItemById(config.pos, config.paredeid)
local parede2 = getTileItemById(config.pos2, config.parede2id)
local parede3 = getTileItemById(config.pos3, config.parede3id)
local parede4 = getTileItemById(config.pos4, config.parede4id)
local parede5 = getTileItemById(config.pos5, config.parede5id)
local parede6 = getTileItemById(config.pos6, config.parede6id)
local parede7 = getTileItemById(config.pos7, config.parede7id)
local parede8 = getTileItemById(config.pos8, config.parede8id)
local parede9 = getTileItemById(config.pos9, config.parede9id)
local parede10 = getTileItemById(config.pos10, config.parede10id)
local parede11 = getTileItemById(config.pos11, config.parede11id) 
local pos,area = getCreaturePosition(cid)
local pos2,area = getCreaturePosition(cid)
local pos3,area = getCreaturePosition(cid)
local pos4,area = getCreaturePosition(cid)
local pos5,area = getCreaturePosition(cid)
local pos6,area = getCreaturePosition(cid)
local pos7,area = getCreaturePosition(cid)
local pos8,area = getCreaturePosition(cid)
local pos9,area = getCreaturePosition(cid)
local pos10,area = getCreaturePosition(cid)
local pos11,area = getCreaturePosition(cid) 
if (pos.z == position.z) and (pos.x == position.x) and (pos.y == position.y) and (pos2.z == position.z) and (pos2.x == position.x) and (pos2.y == position.y) and (pos3.z == position.z) and (pos3.x == position.x) and (pos3.y == position.y) and (pos4.z == position.z) and (pos4.x == position.x) and (pos4.y == position.y) and (pos5.z == position.z) and (pos5.x == position.x) and (pos5.y == position.y) and (pos6.z == position.z) and (pos6.x == position.x) and (pos6.y == position.y) and (pos7.z == position.z) and (pos7.x == position.x) and (pos7.y == position.y) and (pos8.z == position.z) and (pos8.x == position.x) and (pos8.y == position.y) and (pos9.z == position.z) and (pos9.x == position.x) and (pos9.y == position.y) and (pos10.z == position.z) and (pos10.x == position.x) and (pos10.y == position.y) and (pos11.z == position.z) and (pos11.x == position.x) and (pos11.y == position.y) then 
if words == config.palavra then
if parede and parede2 and parede3 and parede4 and parede5 and parede6 and parede7 and parede8 and parede9 and parede10 and parede11 then
if getGlobalStorageValue(config.storage) <= os.time() then 
doRemoveItem(parede.uid, 1)
doRemoveItem(parede2.uid, 1)
doRemoveItem(parede3.uid, 1)
doRemoveItem(parede4.uid, 1)
doRemoveItem(parede5.uid, 1)
doRemoveItem(parede6.uid, 1)
doRemoveItem(parede7.uid, 1)
doRemoveItem(parede8.uid, 1)
doRemoveItem(parede9.uid, 1)
doRemoveItem(parede10.uid, 1)
doRemoveItem(parede11.uid, 1) 
else
doPlayerSendCancel(cid, "A entrada já foi removida.")
return TRUE
end
end
end
end
end