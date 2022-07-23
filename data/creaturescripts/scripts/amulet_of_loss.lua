function onDeath(cid, deathList)
	local amulet = getPlayerSlotItem(cid, CONST_SLOT_NECKLACE)

    if amulet.itemid == 15129 and not getTileInfo(getCreaturePosition(cid)).hardcore then
        doRemoveItem(amulet.uid)
    end
    return true
end
