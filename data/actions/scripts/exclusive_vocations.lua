local vocations = {
	-- Zaraki Kenpachi
    [15765] = 7,

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
	local vocation_name = getPlayerVocationName(cid)
	local old_outfits = VOCATION_OUTFITS[vocation_name]

	doPlayerRemoveOutfit(cid, old_outfits[1])

	if canPlayerWearOutfit(cid, old_outfits[100]) then
		doPlayerRemoveOutfit(cid, old_outfits[100])
	end

	local old_specials = SPECIALS[vocation_name]
	local learned_spell = getPlayerLearnedInstantSpell(cid, old_specials[120])

	if learned_spell then
		doPlayerUnlearnInstantSpell(cid, old_specials[120])
		doPlayerUnlearnInstantSpell(cid, old_specials[150])
	end

	doPlayerSetVocation(cid, vocations[item.itemid])

	vocation_name = getPlayerVocationName(cid)
	local new_outfits = VOCATION_OUTFITS[vocation_name]

	doPlayerAddOutfit(cid, new_outfits[1], 0)

	if getPlayerLevel(cid) > 100 then
		doPlayerAddOutfit(cid, new_outfits[100], 0)
	end

	local new_specials = SPECIALS[vocation_name]

	if learned_spell then
		doPlayerLearnInstantSpell(cid, new_specials[120])
		doPlayerLearnInstantSpell(cid, new_specials[150])
	end

	doRemoveItem(item.uid, 1)
	doPlayerAddItem(cid, VOCATION_WEAPONS[vocation_name])
	doCreatureChangeOutfit(cid, { lookType = new_outfits[1] })
	doSendMagicEffect(getCreaturePosition(cid), 6)

	doRemoveCreature(cid)
	return true
end
