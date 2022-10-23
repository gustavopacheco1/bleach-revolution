local vocations = {
	-- Nnoitra Gilga
	[15675] = 21,

	-- Ulquiorra Ciffer
	[15760] = 6,

	-- Retsu Unohana
	[15761] = 12,

	-- Grimmjow Jaegerjaquez
	[15749] = 18,

	-- Ichigo Kurosaki
	[15750] = 1,
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local old_outfits = VOCATION_OUTFITS[getPlayerVocationName(cid)]

	doPlayerRemoveOutfit(old_outfits[1])

	if canPlayerWearOutfit(cid, old_outfits[100]) then
		doPlayerRemoveOutfit(old_outfits[100])
	end

	doPlayerSetVocation(cid, vocations[item.itemid])

	local new_outfits = VOCATION_OUTFITS[getPlayerVocationName(cid)]

	doPlayerAddOutfit(cid, new_outfits[1])

	if getPlayerLevel(cid) > 100 then
		doPlayerAddOutfit(cid, new_outfits[100])
	end

	doCreatureChangeOutfit(cid, { lookType = new_outfits[1] })
	doSendMagicEffect(getCreaturePosition(cid), 6)
	doRemoveItem(item.uid, 1)

	doRemoveCreature(cid)
	return true
end
