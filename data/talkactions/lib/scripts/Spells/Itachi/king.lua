function onSay(cid, words, param, channel)
local from,to = {x=962, y=885, z=7},{x=973, y=892, z=7} -- começo e final do mapa
local from2,to2 = {x=979, y=901, z=7},{x=991, y=905, z=7} -- começo e final do mapa
local playerpos = getPlayerPosition(cid)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
local position2 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local MaximoSummon = 1 --- Maximo de Monstros Sumonados!!

local summons = getCreatureSummons(cid)
local storage = 171994

if getPlayerStorageValue(cid, storage) == -1 then
doPlayerSendCancel(cid, "Desculpe, você não pode, utilizar um summon, estando em cima de um summon.")
return false
end

if isInRange(getCreaturePosition(cid), from, to) or isInRange(getCreaturePosition(cid), from2, to2) then
setPlayerStorageValue(cid, 19899, 1)
doPlayerSendCancel(cid, "Você não pode usar summons aqui!") return true
end
if(table.maxn(summons) < MaximoSummon) then -- no summons
local clone = doCreateMonster("Tsukuyomi", playerpos)
local clone1 = doCreateMonster("Tsukuyomi", playerpos)
local clone2 = doCreateMonster("Tsukuyomi", playerpos)
local clone3 = doCreateMonster("Tsukuyomi", playerpos)
setPlayerStorageValue(cid, 19899, 1)
doConvinceCreature(cid, clone)
doConvinceCreature(cid, clone1)
doConvinceCreature(cid, clone2)
doConvinceCreature(cid, clone3)
doSendMagicEffect(position1, 152)
doSendMagicEffect(position2, 111)
doCreatureSay(cid, "l TSUKUYoMi l", TALKTYPE_MONSTER)
return TRUE
end
end