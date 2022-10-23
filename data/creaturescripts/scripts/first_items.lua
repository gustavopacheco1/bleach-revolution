local items = {
	{ id = 1988, slot = CONST_SLOT_BACKPACK, container = { { id = 2671, count = 15 } } }, -- Backpack
	{ id = 15813, slot = CONST_SLOT_RIGHT }, -- Wooden Shield
	{ id = 2661, slot = CONST_SLOT_NECKLACE }, -- Scarf
	{ id = 16136, slot = CONST_SLOT_ARMOR }, -- Shinigami Armor
	{ id = 16135, slot = CONST_SLOT_LEGS }, -- Shinigami Legs
	{ id = 16137, slot = CONST_SLOT_FEET } -- Shinigami Boots
}

function onLogin(cid)
	if getPlayerLastLoginSaved(cid) > 0 then
		return true
	end

	doPlayerAddItem(cid, VOCATION_WEAPONS[getPlayerVocationName(cid)], 1, false, CONST_SLOT_LEFT)

	for _, item in pairs(items) do
		local receive_item = doCreateItemEx(item.id)

		if item.container then
			for _, item_in_container in pairs(item.container) do
				local container_item = doCreateItemEx(item_in_container.id, item_in_container.count)
				doAddContainerItemEx(receive_item, container_item)
			end
		end

		doPlayerAddItemEx(cid, receive_item, false, item.slot)
	end
	return true
end
