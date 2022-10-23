local items = {
	{ id = 1988, slot = CONST_SLOT_BACKPACK, container = { { id = 2671, count = 15 } } }, -- Backpack
	{ id = 15813, slot = CONST_SLOT_RIGHT }, -- Wooden Shield
	{ id = 2661, slot = CONST_SLOT_NECKLACE }, -- Scarf
	{ id = 16136, slot = CONST_SLOT_ARMOR }, -- Shinigami Armor
	{ id = 16135, slot = CONST_SLOT_LEGS }, -- Shinigami Legs
	{ id = 16137, slot = CONST_SLOT_FEET } -- Shinigami Boots
}

local weapons = {
	["No Vocation"] = 15129,
	["Ichigo Kurosaki"] = 16339,
	["Chad"] = 16375,
	["Bazz-B"] = 16334,
	["Orihime Inoue"] = 16387,
	["Uryu Ishida"] = 16381,
	["Ulquiorra Ciffer"] = 16393,
	["Zaraki Kenpachi"] = 16357,
	["Byakuya Kuchiki"] = 16429,
	["Toshiro Hitsugaya"] = 15736,
	["Rukia Kuchiki"] = 16345,
	["Nelliel Odelschwanck"] = 16336,
	["Retsu Unohana"] = 16338,
	["Renjii Abarai"] = 16351,
	-- ["Gin Ichimaru"] = ?,
	-- ["Kuugo Ginjou"] = ?,
	-- ["Tier Halibel"] = ?,
	["Urahara Kisuke"] = 16363,
	["Grimmjow Jaegerjaquez"] = 16335,
	["Ikkaku Madarame"] = 16369,
	["Coyote Starrk"] = 16446,
	["Nnoitra Gilga"] = 16337
}

function onLogin(cid)
	if getPlayerLastLoginSaved(cid) > 0 then
		return true
	end

	doPlayerAddItem(cid, weapons[getPlayerVocationName(cid)], 1, false, CONST_SLOT_LEFT)

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
