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
			if getPlayerStorageValue(cid, "tessai_quest") == 1 then
				local player_vocation_name = getPlayerVocationName(cid)

				selfSayMultiLanguage(
					"Congratulations! You proof that you are capable of domain your greatest techniques. You've learned two new techniques: ".. SPECIALS[player_vocation_name][120] .. " and " .. SPECIALS[player_vocation_name][150] .. ".",
					"Parab�ns! Voc� provou que � capaz de dominar suas melhores t�cnicas. Voc� aprendeu duas novas t�cnicas: " .. SPECIALS[player_vocation_name][120] .. " e " .. SPECIALS[player_vocation_name][150] .. ".",
					cid
				)

				doPlayerLearnInstantSpell(cid, SPECIALS[player_vocation_name][120])
				doPlayerLearnInstantSpell(cid, SPECIALS[player_vocation_name][150])

				setPlayerStorageValue(cid, "tessai_quest", 2)
				return true
			end

			if getPlayerStorageValue(cid, "tessai_quest") == 2 then
				local player_name = getCreatureName(cid)
				selfSayMultiLanguage(
					"Hello, " .. player_name .. ", my former student!",
					"Ol�, " .. player_name .. ", meu antigo aluno!",
					cid
				)
				return true
			end

			if getPlayerLevel(cid) < 120 then
				selfSayMultiLanguage(
					"I can teach you to domain your greatest techniques. However, I can already see that you are not capable to domain it yet. Come back here when you reach level 120.",
					"Eu posso te ensinar a dominar as suas melhores t�cnicas. Por�m, eu j� consigo perceber que voc� n�o � capaz de domin�-las ainda. Volte aqui quando alcan�ar o n�vel 120.",
					cid
				)
				npcHandler:addFocus(cid)
				return true
			end

			selfSayMultiLanguage(
				"I can teach you to domain your greatest techniques. However, you need to prove me that you are capable completing my {challenge}.",
				"Eu posso te ensinar a dominar as suas melhores t�cnicas. Por�m, voc� deve me provar que � capaz completando o meu {desafio}.",
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

	if (not npcHandler:isFocused(cid)) or getPlayerLevel(cid) < 120 then
		return false
	end

	if talkState[talkUser] == 2 then
		if isInArray({ "yes", "sim" }, msg) then
			doTeleportThing(cid, {x = 4799, y = 3612, z = 8})
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_EVENT_ADVANCE,
				"Tessai: Get to the end and prove that you are capable of learning what I can teach.",
				"Tessai: Consiga chegar at� o final e prove que voc� � capaz de aprender o que eu posso ensinar."
			)
		end
		return true
	end

	if isInArray({ "challenge", "desafio" }, msg) then
		selfSayMultiLanguage(
			"Do you accept to face the challenge? You won't go back, unless you complete.",
			"Voc� aceita enfrentar o desafio? Voc� n�o ter� volta, a n�o ser que o complete.",
			cid
		)
		talkState[talkUser] = 2
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
