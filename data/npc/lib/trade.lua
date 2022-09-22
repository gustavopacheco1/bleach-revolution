buyable_items = {
	["Ururu Tsumugiya"] = {
		[2293] = { price = 10000 }, -- light reiatsu wall
		[16586] = {price = 10000 }, -- black reiatu wall
	},

	["Jinta"] = {
		[15740] = { price = 2000 }, -- red backpack
		[15776] = { price = 2000 }, -- orange backpack
		[15741] = { price = 2000 }, -- blue backpack
		[15120] = { price = 2000 }, -- hollow bag
	},

	["Hikari"] = {
		[2667] = { price = 2000 }, -- fish
		[2666] = { price = 2000 }, -- meat
		[2676] = { price = 2000 }, -- banana
		[2696] = { price = 2000 }, -- cheese
		[6574] = { price = 2000 }, -- bar of chocolate
	},

	["Kurotsuchi"] = {
		[16111] = { price = 880 }, -- great reiatsu potion
		[16118] = { price = 880 }, -- great health potion
		[16113] = { price = 640 }, -- reiatsu potion
		[16114] = { price = 640 }, -- health potion
		[16112] = { price = 860 }, -- ultimate potion
		[16116] = { price = 200 }, -- reiatsu pill
		[16117] = { price = 200 }, -- health pill
	},

	["Yoshino"] = {
		[16456] = { price = 180000, subType = 180 }, -- wooden sword
	},

	["Yoruichi"] = {
		[16459] = { price = 200000 }, -- stamina injection
	},
	
	["Rukia Kuchiki"] = {
		[15129] = { price = 5000 }, -- reiatsu amulet
	}
}

sellable_items = {
	["Kenji"] = {
		[15006] = { price = 10000 }, -- furie arrancar helmet
		[15305] = { price = 10000 }, -- furie arrancar armor
		[15012] = { price = 10000 }, -- furie arrancar boots
		[15005] = { price = 8000 }, -- elite arrancar helmet
		[15304] = { price = 8000 }, -- elite arrancar armor
		[15011] = { price = 8000 }, -- elite arrancar boots
		[15101] = { price = 6000 }, -- arrancar helmet
		[15112] = { price = 6000 }, -- arrancar armor
		[10731] = { price = 6000 }, -- arrancar boots
		[15245] = { price = 7000 }, -- furie urahara helmet
		[15301] = { price = 7000 }, -- furie urahara armor
		[16436] = { price = 7000 }, -- furie urahara legs
		[15367] = { price = 7000 }, -- furie urahara boots
		[15244] = { price = 5000 }, -- elite urahara helmet
		[15300] = { price = 5000 }, -- elite urahara armor
		[16435] = { price = 5000 }, -- elite urahara legs
		[15366] = { price = 5000 }, -- elite urahara boots
		[15724] = { price = 3000 }, -- urahara helmet
		[15111] = { price = 3000 }, -- urahara armor
		[16115] = { price = 3000 }, -- urahara legs
		[15815] = { price = 3000 }, -- urahara boots
		[15253] = { price = 4000 }, -- furie kyoraku helmet
		[15307] = { price = 4000 }, -- furie kyoraku armor
		[15252] = { price = 3000 }, -- elite kyoraku helmet
		[15306] = { price = 3000 }, -- elite kyoraku armor
		[10677] = { price = 2500 }, -- kyoraku helmet
		[10661] = { price = 2500 }, -- kyoraki armor
		[15222] = { price = 2000 }, -- blank armor
		[15229] = { price = 2000 }, -- blank legs
		[15269] = { price = 1500 }, -- furie mummy helmet
		[15327] = { price = 1500 }, -- furie mummy armor
		[15359] = { price = 1500 }, -- furie mummy legs
		[15379] = { price = 1500 }, -- furie mummy boots
		[15268] = { price = 1000 }, -- elite mummy helmet
		[15326] = { price = 1000 }, -- elite mummy armor
		[15358] = { price = 1000 }, -- elite mummy legs
		[15378] = { price = 1000 }, -- elite mummy boots
		[10690] = { price = 500 }, -- mummy helmet
		[10687] = { price = 500 }, -- mummy armor
		[10688] = { price = 500 }, -- mummy legs
		[10689] = { price = 500 }, -- mummy boots
		[15277] = { price = 300 }, -- furie bandit helmet
		[15333] = { price = 300 }, -- furie bandit armor
		[15363] = { price = 300 }, -- furie bandit legs
		[15381] = { price = 300 }, -- furie bandit boots
		[15276] = { price = 200 }, -- elite bandit helmet
		[15332] = { price = 200 }, -- elite bandit armor
		[15362] = { price = 200 }, -- elite bandit legs 
		[15380] = { price = 200 }, -- elite bandit boots
		[15106] = { price = 100 }, -- bandit helmet
		[15116] = { price = 100 }, -- bandit armor
		[10686] = { price = 100 }, -- bandit legs
		[15119] = { price = 100 }, -- bandit boots
	},

	["Macoio"] = {
		[5897] = { price = 1000 }, -- wolf paw
		[15687] = { price = 1000 }, -- soul essence
		[15230] = { price = 1000 }, -- part of horror
	},

	["Loreto"] = {
		[15249] = { price = 20000 }, -- furie adjuchas mask
		[15248] = { price = 10000 }, -- elite adjuchas mask
		[15102] = { price = 8000 }, -- adjuchas mask
		[15251] = { price = 9000 }, -- furie gillian mask
		[15250] = { price = 7000 }, -- elite gillian mask
		[15103] = { price = 5000 }, -- gillian mask
		[15241] = { price = 8000 }, -- furie grand fisher mask
		[15240] = { price = 6000 }, -- elite grand fisher mask
		[15099] = { price = 4000 }, -- grand fisher mask
		[15261] = { price = 7000 }, -- furie arak mask
		[15260] = { price = 5000 }, -- elite arak mask
		[15105] = { price = 3000 }, -- arak mask
		[15257] = { price = 6000 }, -- furie spider mask
		[15256] = { price = 4000 }, -- elite spider mask
		[15104] = { price = 2000 }, -- spider mask
	},
}

function creatureSayBuy(cid, itemid, subType, amount, ignoreCap, inBackpacks)
	local shopItem = buyable_items[getCreatureName(getNpcId())][itemid]

	local backpack = 1988
	local totalCost = amount * shopItem.price
	if (inBackpacks) then
		totalCost = totalCost + 20 or totalCost + (math.max(1, math.floor(amount / getContainerCapById(backpack))) * 20)
	end

	local parseInfo = {
		[TAG_PLAYERNAME] = getPlayerName(cid),
		[TAG_ITEMCOUNT] = amount,
		[TAG_TOTALCOST] = totalCost,
		[TAG_ITEMNAME] = getItemNameById(itemid)
	}

	if (subType < 1 or getItemInfo(itemid).stackable) then
		subType = -1
	end

	if (getPlayerMoney(cid) < totalCost) then
		local msg = NpcHandler:getMessage(cid, MESSAGE_NEEDMONEY)
		doPlayerSendCancel(cid, NpcHandler:parseMessage(msg, parseInfo))
		return false
	end

	local a, b, item = doNpcSellItem(cid, itemid, amount, subType, ignoreCap, inBackpacks, backpack)

	if (a < amount) then
		local msgId = MESSAGE_NEEDMORESPACE
		if (a == 0) then
			msgId = MESSAGE_NEEDSPACE
		end


		local msg = NpcHandler:getMessage(cid, msgId)
		parseInfo[TAG_ITEMCOUNT] = a

		doPlayerSendCancel(cid, NpcHandler:parseMessage(msg, parseInfo))
		if (a > 0) then

			local prev_money = getPlayerMoney(cid)
			local removeMoney = doPlayerRemoveMoney(cid, (a * shopItem.price) + (b * 20), false)

			if removeMoney == true then
				parseInfo[TAG_TOTALCOST] = a * shopItem.price
				local msg = NpcHandler:getMessage(cid, MESSAGE_BOUGHT)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, NpcHandler:parseMessage(msg, parseInfo))
			else
				for i = 1, #item do
					doRemoveItem(item[i])
				end

				local currentMoney = getPlayerMoney(cid)
				if currentMoney ~= prev_money and currentMoney < prev_money then -- Let's make sure the player did not pay for an item he did not receive.
					doPlayerAddMoney(cid, math.abs(prev_money - currentMoney))
				end

				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,
					"You don't have enough space to receive the change when buying " .. amount .. "x " .. getItemNameById(itemid) .. "!")
			end
			return true
		end

		return false
	else

		local prev_money = getPlayerMoney(cid)

		if doPlayerRemoveMoney(cid, totalCost, false) == true then
			local msg = NpcHandler:getMessage(cid, MESSAGE_BOUGHT)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, NpcHandler:parseMessage(msg, parseInfo))
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,
				"You don't have enough space to receive the change when buying " .. amount .. "x " .. getItemNameById(itemid) .. "!")
			for i = 1, #item do
				doRemoveItem(item[i])
			end

			local currentMoney = getPlayerMoney(cid)
			if currentMoney ~= prev_money and currentMoney < prev_money then -- Let's make sure the player did not pay for an item he did not receive.
				doPlayerAddMoney(cid, math.abs(prev_money - currentMoney))
			end

		end
		return true
	end
end

function creatureSaySell(cid, itemid, subType, amount, ignoreEquipped, dummy)
	local shopItem = sellable_items[getCreatureName(getNpcId())][itemid]

	local parseInfo = {
		[TAG_PLAYERNAME] = getPlayerName(cid),
		[TAG_ITEMCOUNT] = amount,
		[TAG_TOTALCOST] = amount * shopItem.price,
		[TAG_ITEMNAME] = getItemNameById(itemid)
	}

	if (subType < 1 or getItemInfo(itemid).stackable) then
		subType = -1
	end

	if (doPlayerRemoveItem(cid, itemid, amount, subType, ignoreEquipped)) then
		local msg = NpcHandler:getMessage(cid, MESSAGE_SOLD)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, NpcHandler:parseMessage(msg, parseInfo))

		doPlayerAddMoney(cid, amount * shopItem.price)
		return true
	end

	local msg = NpcHandler:getMessage(cid, MESSAGE_NEEDITEM)
	doPlayerSendCancel(cid, NpcHandler:parseMessage(msg, parseInfo))
	return false
end
