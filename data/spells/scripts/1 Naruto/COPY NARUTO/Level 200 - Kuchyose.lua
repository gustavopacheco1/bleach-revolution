function onCastSpell(cid, var)
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
local clone = doCreateMonster("Gamabunta", playerpos)
setPlayerStorageValue(cid, 19899, 1)
doConvinceCreature(cid, clone)
doSendMagicEffect(position1, 152)
doSendMagicEffect(position2, 111)
doPlayerSendTextMessage(cid,27,'Kuchyose no Jutsu.') 
return TRUE
end
end