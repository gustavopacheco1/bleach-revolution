local storage = 171994 -- storage
local item = 12696 -- id do item
local time = 5 -- tempo em segundos que o item vai ficar na posição.

local pos = {}

function lost(cid)
if isPlayer(cid) then
for index, pid in pairs(pos) do
if index == getCreatureName(cid) then
local t = getTileItemById(pos[index], item)
if t.uid > 0 then
doRemoveItem(t.uid)
end
end
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "O selo foi perdido!")
end
end

function onCastSpell(cid, var)

if getPlayerStorageValue(cid, storage) - os.time() <= 0 then
pos[getCreatureName(cid)] = getCreaturePosition(cid)
setPlayerStorageValue(cid, storage, os.time()+time)
doCreateItem(item, getCreaturePosition(cid))
doSendMagicEffect(getCreaturePosition(cid), 3)
addEvent(lost, time*1000, cid)
elseif getPlayerStorageValue (cid, storage) - os.time() >= 1 then
for index, pid in pairs(pos) do
if index == getCreatureName(cid) then
doTeleportThing(cid, pid)
end
end
end

return true
end