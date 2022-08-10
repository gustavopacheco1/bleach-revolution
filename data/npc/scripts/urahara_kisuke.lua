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
		if isInArray({ "hi", "hello", "oi", "ol�" }, msg) then
			selfSayMultiLanguage(
				"Hello, I can take you to my subordinates to drop the Urahara Set, say {yes} and I will take you.",
				"Ol�, posso te levar at� meus subordinados para dropar o Urahara Set, diga {sim} e eu te levarei.",
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

	if isInArray({ "yes", "sim" }, msg) then
		if getPlayerLevel(cid) < 130 then
			selfSayMultiLanguage(
				"You are too weak compared with the place I would take you. When you reach, at least, level 130 come here again.",
				"Voc� � muito fraco comparado com o lugar que eu te levaria. Quando voc� alcan�ar, pelo menos, o n�vel 130 venha at� aqui novamente."
				,
				cid
			)
			npcHandler:releaseFocus(cid)
			return
		end

		doTeleportThing(cid, { x = 3031, y = 3212, z = 7 })
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
