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
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	msg = msg:lower()

	if not npcHandler:isFocused(cid) and getDistanceBetween(getThingPos(cid), getNpcPos()) < 5 then
		if isInArray({ "hi", "hello", "oi", "ol�" }, msg) then
			talkState[talkUser] = nil
			npcHandler:addFocus(cid)
			local player_name = getCreatureName(cid)
			selfSayMultiLanguage(
				"Hello, " .. player_name .. "! I can grant you the {soul protection}. So your losses in battles will be reduced.",
				"Ol�, " .. player_name .. "! Eu consigo te conceder a {prote��o de alma}. Assim, suas perdas em batalhas ser�o reduzidas.",
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

	local multiplier = getCreatureSkullType(cid) >= SKULL_RED and 2 or 1
	local price = (10000 + (200 * (getPlayerLevel(cid) + 50))) * multiplier

	if isInArray({ "soul protection", "prote��o de alma" }, msg) then
		if getPlayerBlessing(cid, 1) then
			selfSayMultiLanguage(
				"You have already received the soul protection.",
				"Voc� j� recebeu a prote��o de alma.",
				cid
			)
			return false
		end

		selfSayMultiLanguage(
			"For you the price for it is " .. price .. " ryo. Are you sure?",
			"Para voc� o pre�o por isso � " .. price .. " ryo. Voc� tem certeza?",
			cid
		)
		talkState[talkUser] = 1
		return true
	end

	if isInArray({ "yes", "sim" }, msg) and talkState[talkUser] == 1 then
		if not (doPlayerRemoveMoney(cid, price)) then
			selfSayMultiLanguage(
				"Sorry, you do not have enough money.",
				"Desculpe, voc� n�o tem dinheiro suficiente.",
				cid
			)
			return false
		end

		talkState[talkUser] = nil

		doPlayerAddBlessings(cid)

		selfSayMultiLanguage(
			"It was a pleasure doing business with you. You've received the soul protection.",
			"Foi um prazer fazer neg�cios com voc�. Voc� recebeu a prote��o de alma.",
			cid
		)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
