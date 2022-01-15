local table = {
[1] = 2882, --- [1] Vocation 2882 == ID Do Corpse
[2] = 2882 

}

local function transform(pos, id, voc)
local item = getTileItemById(pos, id)
if item and item.uid > 1 then
doTransformItem(item.uid, table[voc])
doDecayItem(item.uid or 0)
end
end

function onDeath(cid, corpse)
if not isPlayer(cid) or not table[getPlayerOutfit(cid)] then return true end
addEvent(transform, 15, getThingPos(cid), corpse.itemid, getPlayerOutfit(cid))
return true
end