local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg:lower()) end

function onThink() npcHandler:onThink() end

function onThink() npcHandler:onThinkCreatureSay() end

local talkState = {}

function onCreatureSay(cid, type, msg)
	msg = msg:lower()
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if not npcHandler:isFocused(cid) and getDistanceBetween(getThingPos(cid), getNpcPos()) < 5 then
		if isInArray({ "hi", "hello", "oi", "ol�" }, msg) then
			talkState[talkUser] = nil
			selfSayMultiLanguage(
				"Hello! This device is called {Reishi Henkan-Ki}.",
				"Ol�! Este aparelho � chamado de {Reishi Henkan-Ki}.",
				cid
			)
			npcHandler:addFocus(cid)
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

	if msg == "reishi henkan-ki" then
		selfSayMultiLanguage(
			"This device is used to convert human particles to spirit particles, so, it's possible to travel to Soul Society. If you {pay} me I can enable it for you.",
			"Este aparelho � utilizado para converter part�culas do mundo humano para part�culas espirituais, assim, sendo poss�vel chegar em Soul Society. Se voc� me {pagar} eu posso ativ�-lo para voc�.",
			cid
		)
		return true
	end

	if isInArray({ "pay", "pagar" }, msg) then
		if getPlayerLevel(cid) < 120 then
			selfSayMultiLanguage(
				"Sorry, you're not powerful enough to travel to Soul Society. When you reach level 120 talk to me.",
				"Desculpe, mas voce n�o � forte o suficiente para ir at� a Soul Society. Quando alcan�ar o n�vel 120 fale comigo.",
				cid
			)
			return true
		end

		selfSayMultiLanguage(
			"The price to me enable Reishi Henkan-Ki is 80000 ryo. Are you sure?",
			"O pre�o para eu ativar o Reishi Henkan-Ki � 80000 ryo. Voc� tem certeza?",
			cid
		)
		talkState[talkUser] = 1
		return true
	end

	if isInArray({ "yes", "sim" }, msg) and talkState[talkUser] == 1 then
		if getCreatureStorage(cid, "reishi_henkan-ki") == 1 then
			selfSayMultiLanguage(
				"Reishi Henkan-Ki is already enabled.",
				"O Reishi Henkan-Ki j� est� ativo.",
				cid
			)
			return true
		end

		if not doPlayerRemoveMoney(cid, 80000) then
			selfSayMultiLanguage(
				"Sorry, you do not have enough money.",
				"Desculpe, voc� n�o tem dinheiro suficiente.",
				cid
			)
			return true
		end

		doCreatureSetStorage(cid, "reishi_henkan-ki", 1)
		doSendMagicEffect({ x = 3569, y = 3443, z = 8 }, 215, cid)
		selfSayMultiLanguage(
			"It was a pleasure doing business with you. Reishi Henkan-Ki was enabled.",
			"Foi um prazer fazer neg�cios com voc�. O Reishi Henkan-Ki foi ativo.",
			cid
		)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
