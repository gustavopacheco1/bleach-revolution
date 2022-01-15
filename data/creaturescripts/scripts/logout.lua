function onLogout(cid)

if getCreatureStorage(cid, FLY_STORAGE) > 0 then
local pos = getCreaturePosition(cid)
pos.stackpos = 0
for _, area in ipairs(getArea(pos, RANGEX, RANGEY)) do
doCreateTile(area)
local thing = getThingFromPos(area)
if thing.itemid == ITEM_FLYTILE then
doRemoveItem(thing.uid)
elseif thing.itemid == ITEM_WATERTILE then
doTransformItem(thing.uid, WATER[1])
end
end
doCreatureSetStorage(cid, storPos.x, pos.x)
doCreatureSetStorage(cid, storPos.y, pos.y)
doCreatureSetStorage(cid, storPos.z, pos.z)
end
return true
end