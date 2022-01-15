function onStepIn(cid, item, position, fromPosition)
local storage = 89745
local fromPos,toPos = {x=1014,y=808,z=7},{x=1053,y=860,z=7}
local fromPos2,toPos2 = {x=1026,y=861,z=7},{x=1043,y=870,z=7}
local fromPos3,toPos3 = {x=1026,y=811,z=6},{x=1037,y=821,z=6}
if item.actionid == 28534 and getPlayerStorageValue(cid, storage) < 3 then
doTeleportThing(cid, fromPosition, true)
doCreatureSay(cid, "Somente Shinobis com graduação Jounin podem fazer o Exame Anbu!", TALKTYPE_MONSTER)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
for x = fromPos.x, toPos.x do
for y = fromPos.y,toPos.y do
local m = getTopCreature({x=x, y=y, z=fromPos.z}).uid
for xx = fromPos2.x, toPos2.x do
for yy = fromPos2.y,toPos2.y do
local mm = getTopCreature({x=xx, y=yy, z=fromPos.z}).uid
if m~= 0 and isPlayer(m) or mm~= 0 and isPlayer(mm) then
doTeleportThing(cid, fromPosition, true)
return doPlayerSendCancel(cid, "Alguem esta fazendo o teste, espere ele terminar.")
end
end
end
end
end
return true
end