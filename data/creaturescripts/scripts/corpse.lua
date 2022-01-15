local table = {
[1] = 2930, --[vocation] = id do corpse
}

local function transform(pos, id, lookType)
local item = getTileItemById(pos, id)
if item and item.uid > 1 then
doTransformItem(item.uid, table[lookType])
doDecayItem(item.uid or 0)
end
end

function onDeath(cid, corpse)
if not isPlayer(cid) or not table[getPlayerVocation(cid)] then return true end
addEvent(transform, 15, getThingPos(cid), corpse.itemid, getPlayerOutfit(cid).lookType)
return true
end