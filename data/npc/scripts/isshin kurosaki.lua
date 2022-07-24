local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg:lower()) end

function onThink() npcHandler:onThink() end

function onThink() npcHandler:onThinkCreatureSay() end

local talkState = {}
local blessings = { 1, 2, 3, 4, 5 }
local price = 50000

function onCreatureSay(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	msg = msg:lower()

	if not npcHandler:isFocused(cid) and getDistanceBetween(getThingPos(cid), getNpcPos()) < 5 then
		if isInArray({ "hi", "hello", "oi", "olá" }, msg) then
			talkState[talkUser] = nil
			npcHandler:addFocus(cid)
			local player_name = getCreatureName(cid)
			selfSayMultiLanguage(
				"Hello, " .. player_name .. "! I can grant you the {soul protection}. So your losses in battles will be reduced.",
				"Olá, " ..
				player_name .. "! Eu consigo te conceder a {proteção de alma}. Assim, suas perdas em batalhas serão reduzidas.",
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

	if isInArray({ "soul protection", "proteção de alma" }, msg) then
		if getPlayerBlessing(cid, 1) then
			selfSayMultiLanguage(
				"You have already received the soul protection.",
				"Você já recebeu a proteção de alma.",
				cid
			)
			return false
		end

		selfSayMultiLanguage(
			"The price for it is " .. price .. " ryos. Are you sure?",
			"O preço por isso é " .. price .. " ryos. Você tem certeza?",
			cid
		)
		talkState[talkUser] = 1
		return true
	end

	if isInArray({ "yes", "sim" }, msg) and talkState[talkUser] == 1 then
		if not (doPlayerRemoveMoney(cid, price)) then
			selfSayMultiLanguage(
				"Sorry, you do not have enough money.",
				"Desculpe, você não tem dinheiro suficiente.",
				cid
			)
			return false
		end

		talkState[talkUser] = nil

		for i = 1, #blessings do
			doPlayerAddBlessing(cid, i)
		end

		selfSayMultiLanguage(
			"It was a pleasure doing business with you. You've received the soul protection.",
			"Foi um prazer fazer negócios com você. Você recebeu a proteção de alma.",
			cid
		)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
