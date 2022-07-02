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
			npcHandler:addFocus(cid)
			selfSayMultiLanguage(
				"Hello! I can {bless} you for a small amount of coins.",
				"Olá! Eu posso te conceder a {bless} por uma pequena quantia de coins.",
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

	if msg == "bless" then
		selfSayMultiLanguage(
			"Do you want to be blessed for " .. price .. " coins?",
			"Você deseja receber a bless por " .. price .. " coins?",
			cid
		)
		talkState[talkUser] = 1
		return true
	end

	if isInArray({ "yes", "sim" }, msg) and talkState[talkUser] == 1 then
		if getPlayerBlessing(cid, 1) then
			selfSayMultiLanguage(
				"You have already been blessed.",
				"Você já recebeu a bless.",
				cid
			)
			return false
		end

		if not (doPlayerRemoveMoney(cid, price)) then
			selfSayMultiLanguage(
				"You do not have enough money",
				"Você não tem dinheiro suficiente",
				cid
			)
			return false
		end

		for i = 1, #blessings do
			doPlayerAddBlessing(cid, i)
		end

		selfSayMultiLanguage(
			"It was a pleasure doing business with you. You have been blessed.",
			"Foi um prazer fazer negócios com você. Você recebeu a bless.",
			cid
		)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
