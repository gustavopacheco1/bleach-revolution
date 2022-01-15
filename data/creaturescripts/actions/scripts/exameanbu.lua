function onUse(cid, item)

local pos = {x=1031, y=871, z=7, stackpos=253} -- posição do jogador mais proximo da alavanca
local uid = nil
local delay = 100 -- tempo para resetar a quest
local t = {}
                                                    
for i = pos.x -1, pos.x do
local player = getThingFromPos({x=i, y=pos.y, z=pos.z, stackpos=253}).uid
if isCreature(player) then
if getPlayerStorageValue(player, 132807) == -1 and getPlayerLevel(player) >= 10 then
uid = uid == nil and 1 or uid + 1
t[uid] = player
end
else
return doPlayerSendCancel(cid, "Voce precisa de 2 membros para fazer a quest.")
end
end

if #t == 2 then
if getGlobalStorageValue(132807) - os.time() <= 0 then
for i = pos.x -2, pos.x do
doTeleportThing(getThingFromPos({x=i, y=pos.y, z=pos.z, stackpos=253}).uid, {x=i, y=pos.y, z=pos.z + 1})
doSendMagicEffect({x=i, y=pos.y, z=pos.z + 1}, 27)
doPlayerSendTextMessage(cid, 22, "Voce tem apenas 25 minutos para fazer a quest, caso contrario sera teleportado para fora!")
end
doRespaw('beezer')
setGlobalStorageValue(132807, delay + os.time())
addEvent(doCheck, delay*1000, t)
else
doPlayerSendCancel(cid, "Espere "..getGlobalStorageValue(132807) - os.time().." segundos para fazer a quest.")
end
else
doPlayerSendCancel(cid, "Alguem no seu grupo ja fez a quest.")
end

return TRUE
end

function doRespaw(mon)

mon1 = {x=1058, y=845, z=7, stackpos=253} -- posição demon 1
mon2 = {x=1058, y=846, z=7, stackpos=253} -- posição demon 2
mon3 = {x=1061, y=846, z=7, stackpos=253} -- posição demon 3


doCreateMonster(mon, mon1)
doCreateMonster(mon, {x=mon1.x +2, y=mon1.y, z=mon1.z})
doCreateMonster(mon, mon2)
doCreateMonster(mon, {x=mon2.x +2, y=mon2.y, z=mon2.z})
doCreateMonster(mon, mon3)
doCreateMonster(mon, {x=mon3.x +1, y=mon3.y, z=mon3.z})

end

function doCheck(tab)

local templepos = {x=1030, y=873, z=7}

for i = 1, 4 do
if isCreature(tab[i]) then
if getPlayerStorageValue(tab[i], 132807) == -1 then
doTeleportThing(tab[i], templepos)
doCreatureSay(cid, "Voce tem apenas 25 minutos para finalizar a Quest, por isso foi teleportado para fora da quest!", TALKTYPE_MONSTER)
end
end
end

for posx = mon1.x, mon1.x + 2, 2 do
local monster = {x=posx, y=mon1.y, z=mon1.z, stackpos=253}
if isCreature(getThingFromPos(monster).uid) then
if string.lower(getCreatureName(getThingFromPos(monster).uid)) == 'beezer' and isMonster(getThingFromPos(monster).uid) then
doRemoveCreature(getThingFromPos(monster).uid)
end
end

end

for posx = mon2.x, mon2.x + 2, 2 do
local monster = {x=posx, y=mon2.y, z=mon2.z, stackpos=253}
if isCreature(getThingFromPos(monster).uid) then
if string.lower(getCreatureName(getThingFromPos(monster).uid)) == 'beezer' and isMonster(getThingFromPos(monster).uid) then
doRemoveCreature(getThingFromPos(monster).uid)
end
end

end

for posx = mon3.x, mon3.x + 1 do
local monster = {x=posx, y=mon3.y, z=mon3.z, stackpos=253}
if isCreature(getThingFromPos(monster).uid) then
if string.lower(getCreatureName(getThingFromPos(monster).uid)) == 'beezer' and isMonster(getThingFromPos(monster).uid) then
doRemoveCreature(getThingFromPos(monster).uid)
end
end
end

end