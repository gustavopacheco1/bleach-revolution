local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg:lower()) end

function onThink() npcHandler:onThinkCreatureSay() end

local talkState = {}

function onCreatureSay(cid, type, msg)
	msg = msg:lower()
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if not npcHandler:isFocused(cid) and getDistanceBetween(getThingPos(cid), getNpcPos()) <= 4 then
		if isInArray({ "hi", "hello", "oi", "olá" }, msg) then
			local player_name = getPlayerName(cid)
			if not table.contains({ 2, 3, 4 }, getCreatureStorage(cid, "tutorial")) then
				selfSayMultiLanguage(
					"Hello, " .. player_name .. ". I'm sorry, but I don't have more money to offer you a job."
					,
					"Olá, " .. player_name .. ". Sinto muito, mas não tenho mais dinheiro para te oferecer um serviço.",
					cid
				)
				return true
			end

			if getCreatureStorage(cid, "tutorial") == 3 then
				local storage_value = getCreatureStorage(cid, "tutorial_task")
				local plural = ""
				if storage_value ~= 1 then
					plural = "s"
				end

				selfSayMultiLanguage(
					"You've killed " .. storage_value .. " rat" .. plural .. " of 10. Go kill the rest!",
					"Você matou " .. storage_value .. " rato" .. plural .. " de 10. Vá matar o resto!",
					cid
				)
				return true
			end

			if getCreatureStorage(cid, "tutorial") == 4 then
				selfSayMultiLanguage(
					"You did a great job! Here's your reward, 50 ryo as promised.",
					"Você fez um ótimo trabalho! Aqui está a sua recompensa, 50 ryo como prometido",
					cid
				)

				doCreatureSetStorage(cid, "tutorial", 5)
				doSendTutorialArrow(
					cid,
					{ x = 156, y = 31, z = 8 },
					"tutorial",
					5,
					{ x = 143, y = 23, z = 7 }
				)
				doPlayerAddItem(cid, ITEM_GOLD_COIN, 50)
				return true
			end

			talkState[talkUser] = nil
			selfSayMultiLanguage(
				"Hello, " .. player_name .. ". Would you like to do a {job} for me?."
				,
				"Olá, " .. player_name .. ". Você gostaria de fazer um {serviço} para mim?",
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

	if isInArray({ "job", "serviço" }, msg) and talkState[talkUser] == nil then
		selfSayMultiLanguage(
			"My basement is infested with rats. If you manage to eliminate 10 rats I pay you 50 ryo. What do you think?",
			"Meu porão está infestado de ratos. Se você conseguir eliminar 10 ratos eu te pago 50 ryo. O que acha?",
			cid
		)
		talkState[talkUser] = 1
		return true
	end

	if isInArray({ "yes", "sim" }, msg) and talkState[talkUser] == 1 then
		selfSayMultiLanguage(
			"Wonderful! You can start it now. When you eliminate 10 rats come to me.",
			"Maravilha! Você já pode começar. Quando eliminar 10 ratos volte aqui.",
			cid
		)
		registerCreatureEvent(cid, "TutorialTask")
		doCreatureSetStorage(cid, "tutorial", 3)
		return true
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
