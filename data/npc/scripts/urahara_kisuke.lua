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
		if isInArray({ "hi", "hello", "oi", "olá" }, msg) then
			talkState[talkUser] = nil
			selfSayMultiLanguage(
				"Hello! This device is called {Reishi Henkan-Ki}.",
				"Olá! Este aparelho é chamado de {Reishi Henkan-Ki}.",
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
			"Este aparelho é utilizado para converter partículas do mundo humano para partículas espirituais, assim, sendo possível chegar em Soul Society. Se você me {pagar} eu posso ativá-lo para você.",
			cid
		)
		return true
	end

	if isInArray({ "pay", "pagar" }, msg) then
		if getPlayerLevel(cid) < 120 then
			selfSayMultiLanguage(
				"Sorry, you're not powerful enough to travel to Soul Society. When you reach level 120 talk to me.",
				"Desculpe, mas voce não é forte o suficiente para ir até a Soul Society. Quando alcançar o nível 120 fale comigo.",
				cid
			)
			return true
		end

		selfSayMultiLanguage(
			"The price to me enable Reishi Henkan-Ki is 80000 ryo. Are you sure?",
			"O preço para eu ativar o Reishi Henkan-Ki é 80000 ryo. Você tem certeza?",
			cid
		)
		talkState[talkUser] = 1
		return true
	end

	if isInArray({ "yes", "sim" }, msg) and talkState[talkUser] == 1 then
		if getCreatureStorage(cid, "reishi_henkan-ki") == 1 then
			selfSayMultiLanguage(
				"Reishi Henkan-Ki is already enabled.",
				"O Reishi Henkan-Ki já está ativo.",
				cid
			)
			return true
		end

		if not doPlayerRemoveMoney(cid, 80000) then
			selfSayMultiLanguage(
				"Sorry, you do not have enough money.",
				"Desculpe, você não tem dinheiro suficiente.",
				cid
			)
			return true
		end

		doCreatureSetStorage(cid, "reishi_henkan-ki", 1)
		doSendMagicEffect({ x = 3569, y = 3443, z = 8 }, 215, cid)
		selfSayMultiLanguage(
			"It was a pleasure doing business with you. Reishi Henkan-Ki was enabled.",
			"Foi um prazer fazer negócios com você. O Reishi Henkan-Ki foi ativo.",
			cid
		)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
