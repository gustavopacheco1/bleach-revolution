local loot_bags = {
	[16330] = 16331,
	[16332] = 16333
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	doTransformItem(item.uid, loot_bags[item.itemid])
	return false
end
