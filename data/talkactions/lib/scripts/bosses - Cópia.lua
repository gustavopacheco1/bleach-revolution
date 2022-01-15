function onSay(cid, words, param, channel) 

local function Open_Event()
local mob = getTopCreature({x=1014,y=890,z=7}).uid
if mob ~= 0 and isCreature(mob) then
doTeleportThing(mob, {x=1014,y=891,z=7})
end
if getGlobalStorageValue(12530) > 0 then
doCreateMonster(param,{x=1157,y=695,z=7})
if getTileItemById({x=1014,y=890,z=7},1536).uid < 1 then
doCreateItem(1536,1,{x=1014,y=890,z=7})
end
doBroadcastMessage("O evento Bosses começou!", MESSAGE_EVENT_ADVANCE)
local chest = doCreateItem(1740,1,{x=1153,y=698,z=8})
if(param == "the kurama boss") then
doItemSetAttribute(chest, "uid", 15211)
elseif(param == "the hidan boss") then
doItemSetAttribute(chest, "uid", 15212)
return TRUE
end
return TRUE
end
return TRUE
end

if (param == "") then
doPlayerSendTextMessage(cid, 27, "Diga o nome do boss do evento.")
return TRUE
end

local Bosses = {
[1] = "the kurama boss",
[2] = "the hidan boss"
}

for i=1, #Bosses do
if (param == Bosses[i]) then
if getGlobalStorageValue(12530) > 0 then
doPlayerSendTextMessage(cid, 27, "O evento Bosses ja esta aberto.")
return TRUE
end
setGlobalStorageValue(12530,1)
doBroadcastMessage("O evento Bosses esta Aberto!! o teleport fechara em 3 minutos! BOSS: "..param.."", MESSAGE_EVENT_ADVANCE)
if getTileItemById({x=1014,y=890,z=7},1536).uid > 0 then
doRemoveItem(getTileItemById({x=1014,y=890,z=7},1536).uid)
end
if getTileItemById({x=1153,y=698,z=8},1740).uid > 0 then
doRemoveItem(getTileItemById({x=1153,y=698,z=8},1740).uid)
end
local event = addEvent(Open_Event, 3*60*1000)
setGlobalStorageValue(1200,event)
return TRUE
end
end

if (param == "arrumar") then
doTeleportThing(cid, {x=1153, y=703, z=7})
return TRUE
end

if (param == "close") then
if getGlobalStorageValue(12530) < 1 then
doPlayerSendTextMessage(cid, 27, "O evento Bosses ja esta fechado.")
return TRUE
end
if getTileItemById({x=1014,y=890,z=7},1536).uid == 0 then
doCreateItem(1536,1,{x=1014,y=890,z=7})
end
local mob = getTopCreature({x=1014,y=890,z=7}).uid
if mob ~= 0 and isCreature(mob) then
doTeleportThing(mob, {x=1014,y=891,z=7})
end
doBroadcastMessage("O evento Bosses foi cancelado!", MESSAGE_EVENT_ADVANCE)
setGlobalStorageValue(12530, -1)
stopEvent(getGlobalStorageValue(1200))
local from,to = {x=1139, y=685, z=7},{x=1166, y=712, z=7}
for x = from.x, to.x do
for y = from.y, to.y do
for z = 6, 7 do
local mob = getTopCreature({x=x, y=y, z=z}).uid
if mob ~= 0 and isPlayer(mob) then
doRemoveCondition(mob, CONDITION_POISON)
doRemoveCondition(mob, CONDITION_PARALYZE)
doRemoveCondition(mob, CONDITION_OUTFIT)
doCreatureAddHealth(mob, getCreatureMaxHealth(mob))
doTeleportThing(mob, {x=1014 ,y=894 ,z=7})
end
if isMonster(mob) then
doRemoveCreature(mob)
end
end
end
end
end
return TRUE
end