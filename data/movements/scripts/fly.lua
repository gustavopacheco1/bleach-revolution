function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)


if isInArray({ITEM_FLYTILE, ITEM_WATERTILE}, item.itemid) then

if not isPlayer(cid) then
doTeleportThing(cid, fromPosition)
return true
end
if getCreatureStorage(cid, FLY_STORAGE) < 1 then
doPlayerSendCancel(cid, ret[4])
doTeleportThing(cid, fromPosition)
return true
end 

local toPos = toPosition
toPos.stackpos = 0
if not flyBlackSQM then
toPos.z = 7
doCreateTile(toPos)
if getThingFromPos(toPos).itemid < 1 or getThingFromPos(toPos).itemid == ITEM_FLYTILE then
doTeleportThing(cid, fromPosition)
return true
end
toPos.z = toPosition.z
end

if(getTileInfo(toPos).house) then
doTeleportThing(cid, fromPosition)
return true
end

if nonFlyableBorder and type(nonFlyableBorder) == "table" then
for i = toPos.z, 14 do
toPos.z = i
toPos.stackpos = 1
doCreateTile(toPos)
if isInArray(nonFlyableBorder, getThingFromPos(toPos).itemid) then
doTeleportThing(cid, fromPosition)
return true
end
end
toPos.z = getCreaturePosition(cid).z
toPos.stackpos = 0
end
for _, area in ipairs(getArea(toPos, RANGEX, RANGEY)) do
doCreateTile(area)
local thing = getThingFromPos(area)
if thing.itemid < 1 or thing.itemid == ITEM_FLYTILE then
doCreateItem(ITEM_FLYTILE, 1, area)
elseif thing.itemid == ITEM_WATERTILE or isInArray(WATER, thing.itemid) then
doTransformItem(thing.uid, ITEM_WATERTILE)
end
end
end
return true
end

function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)

local area = getAreaToRemove(fromPosition, toPosition)
for _, arear in ipairs(area) do
doCreateTile(arear)
local thing = getThingFromPos(arear)
if thing.itemid == ITEM_FLYTILE then
doRemoveItem(thing.uid)
elseif thing.itemid == ITEM_WATERTILE then
doTransformItem(thing.uid, WATER[1])
end
end
return true
end 