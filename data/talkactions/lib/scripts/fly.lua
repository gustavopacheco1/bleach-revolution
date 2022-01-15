function onSay(cid, words, param)

local pos = getCreaturePosition(cid)
pos.stackpos = 0

if(words == "!fly") then
if getCreatureStorage(cid, FLY_STORAGE) > 0 then
if not isWalkable(getCreaturePosition(cid)) or getThingFromPos(pos).itemid == ITEM_FLYTILE or getThingFromPos(pos).itemid == ITEM_WATERTILE then
doPlayerSendCancel(cid, ret[3])
return true
end
doChangeSpeed(cid, -getCreatureSpeed(cid) + getCreatureBaseSpeed(cid))
doCreatureSetStorage(cid, FLY_STORAGE, 0)
doRemoveCondition(cid, CONDITION_OUTFIT)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, ret[2])
return true
else
doCreatureSetStorage(cid, FLY_STORAGE, 1)
doRemoveConditions(cid, true)
doSetCreatureOutfit(cid, FLY_OUTFIT, -1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, ret[1])
if changeSpeed then
doChangeSpeed(cid, flySpeed)
end
return true
end
elseif(words == "fly") then
if param == "up" then

pos.z = pos.z - 1
doCreateTile(pos)
if getCreatureStorage(cid, FLY_STORAGE) < 1 then
doPlayerSendCancel(cid, ret[4])
return true
end
if(getCreaturePosition(cid).z == 0) or (getThingFromPos(pos).itemid ~= ITEM_FLYTILE and getThingFromPos(pos).itemid > 0) or (getTileInfo(pos).house) then
doPlayerSendCancel(cid, ret[5])
return true
end
local tpos = pos
tpos.stackpos = 253
if isCreature(getThingFromPos(tpos).uid) then
doPlayerSendCancel(cid, ret[5])
return true
end

local toCreate = {}
for _, area in ipairs(getArea(pos, RANGEX, RANGEY)) do
doCreateTile(area)
local thing = getThingFromPos(area)
if thing.itemid < 1 then
table.insert(toCreate, area)
end
end
if getThingFromPos(pos).itemid < 1 then
for _, create in ipairs(toCreate) do
create.stackpos = 0
doCreateItem(ITEM_FLYTILE, 1, create)
end
doTeleportThing(cid, pos)
if changeSpeed then
doChangeSpeed(cid, flySpeed)
end
pos.z = pos.z + 1
doSendMagicEffect(pos, CONST_ME_BLOCKHIT)
for _, area in ipairs(getArea(pos, RANGEX, RANGEY)) do
doCreateTile(area)
local thing = getThingFromPos(area)
if thing.itemid == ITEM_FLYTILE then
doRemoveItem(thing.uid)
elseif thing.itemid == ITEM_WATERTILE then
doTransformItem(thing.uid, WATER[1])
end
end
else
doPlayerSendCancel(cid, ret[7])
end

elseif param == "down" then

pos.z = pos.z + 1
doCreateTile(pos)
if getCreatureStorage(cid, FLY_STORAGE) < 1 then
doPlayerSendCancel(cid, ret[4])
return true
end
if getCreaturePosition(cid).z == 14 then
doPlayerSendCancel(cid, ret[6])
return true
end
if(getTileInfo(pos).house) then
doPlayerSendCancel(cid, ret[6])
return true
end
local cpos = getCreaturePosition(cid)
cpos.stackpos = 0
if getThingFromPos(cpos).itemid ~= ITEM_FLYTILE then
doPlayerSendCancel(cid, ret[6])
return true
end
local tpos = pos
tpos.stackpos = 253
if isCreature(getThingFromPos(tpos).uid) then
doPlayerSendCancel(cid, ret[6])
return true
end

local toCreate = {}
for _, area in ipairs(getArea(pos, RANGEX, RANGEY)) do
doCreateTile(area) 
local thing = getThingFromPos(area)
if(thing.itemid < 1 or isInArray(WATER, thing.itemid)) then
table.insert(toCreate, area) 
end
end

local x = false
if isWalkable(pos) or getThingFromPos(pos).itemid < 1 or isInArray(WATER, getThingFromPos(pos).itemid) then
for _, create in ipairs(toCreate) do
if isInArray(WATER, getThingFromPos(create).itemid) then
doTransformItem(getThingFromPos(create).uid, ITEM_WATERTILE)
x = (create.z == pos.z and true or false)
else
doCreateItem(ITEM_FLYTILE, 1, create)
end
end
doTeleportThing(cid, pos)

if changeSpeed then
doChangeSpeed(cid, (x and (-getCreatureSpeed(cid) + waterSpeed + getCreatureBaseSpeed(cid)) or (-getCreatureSpeed(cid) + flySpeed + getCreatureBaseSpeed(cid))))
end
pos.z = pos.z - 1
doSendMagicEffect(pos, CONST_ME_BLOCKHIT)
for _, area in ipairs(getArea(pos, RANGEX, RANGEY)) do
local thing = getThingFromPos(area)
if thing.itemid == ITEM_FLYTILE then
doRemoveItem(thing.uid)
end
end
else
doPlayerSendCancel(cid, ret[7])
end
end
end
return true
end