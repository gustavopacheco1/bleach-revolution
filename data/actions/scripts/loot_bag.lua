local loot_bags = {
	[16330] = 16331,
	[16332] = 16333
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local owner = getPlayerByNameWildcard(getPlayerNameByGUID(getItemAttribute(item.uid, "corpseowner")))

	if cid ~= owner or not loot_bags[item.itemid] then
		return
	end

	local corpse_owner_uid = getItemAttribute(item.uid, "corpseowner")
	doTransformItem(item.uid, loot_bags[item.itemid])
	doItemSetAttribute(item.uid, "corpseowner", corpse_owner_uid)

	if getCreatureStorage(cid, "autoloot") == 1 then
		doLootCorpse(cid, fromPosition)
	end
end
