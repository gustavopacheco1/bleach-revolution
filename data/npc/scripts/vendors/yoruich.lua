local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg:lower()) end

function onThink() npcHandler:onThink() end

function onThink() npcHandler:onThinkCreatureSay() end

function onCreatureSay(cid, type, msg)
	msg = msg:lower()

	if not npcHandler:isFocused(cid) and getDistanceBetween(getThingPos(cid), getNpcPos()) < 5 then
		if isInArray({ "hi", "hello", "oi", "olá" }, msg) then
			npcHandler:addFocus(cid)
			selfSayMultiLanguage(
				"Hello! I sell Stamina Refill for an amount of Gold.",
				"Olá! Eu vendo Stamina Refill por uma quantia de Gold.",
				cid
			)
			return true
		end
	end

	if isInArray({ "bye", "goodbye", "tchau", "adeus" }, msg) and npcHandler:isFocused(cid) then
		npcHandler:releaseFocus(cid)
		selfSayMultiLanguage(
			"Goodbye!",
			"Adeus!",
			cid
		)
		return true
	end

	if (not npcHandler:isFocused(cid)) then
		return false
	end

	if isInArray({ "trade", "offer" }, msg) then
		selfSayMultiLanguage(
			'Here\'s my offer, ' .. getPlayerName(cid) .. '. Don\'t you like it?',
			'Aqui está minha oferta, ' .. getPlayerName(cid) .. '. Você não gostou?',
			cid
		)

		local shopWindow = {}
		for var, ret in pairs(buyable_items[getCreatureName(getNpcId())]) do
			table.insert(shopWindow, {
				id = var,
				subType = 0,
				buy = ret.price,
				sell = 0,
				name = getItemNameById(var)
			})
		end

		openShopWindow(cid, shopWindow, creatureSayBuy, creatureSaySell)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
