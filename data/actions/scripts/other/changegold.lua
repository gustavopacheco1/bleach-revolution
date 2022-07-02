local coins = {
	[ITEM_GOLD_COIN] = {
		to = ITEM_PLATINUM_COIN
	},
	[ITEM_PLATINUM_COIN] = {
		from = ITEM_GOLD_COIN, to = ITEM_CRYSTAL_COIN
	},
	[ITEM_CRYSTAL_COIN] = {
		from = ITEM_PLATINUM_COIN
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerFlagValue(cid, PLAYERFLAG_CANNOTPICKUPITEM)) then
		return false
	end

	local coin = coins[item.itemid]
	if (not coin) then
		return false
	end

	if (coin.to ~= nil and item.type == ITEMCOUNT_MAX) then
		doChangeTypeItem(item.uid, item.type - item.type)
		doPlayerAddItem(cid, coin.to, 1)
	elseif (coin.from ~= nil) then
		doChangeTypeItem(item.uid, item.type - 1)
		doPlayerAddItem(cid, coin.from, ITEMCOUNT_MAX)
	end

	return true
end
