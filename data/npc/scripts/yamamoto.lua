local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg:lower()) end

function onThink() npcHandler:onThink() end

function onThink() npcHandler:onThinkCreatureSay() end

local talkState = {}
local task_monsters = {
	{ name = "Snake Hollow", total_kills = 100 },
	{ name = "Hollow Wolf", total_kills = 400 },
	{ name = "Fishbone D", total_kills = 1200 },
	{ name = "Giant Snake", total_kills = 1700 },
	{ name = "Furie Hollow", total_kills = 2000 },
	{ name = "Acidwire", total_kills = 2500 },
	{ name = "Mini Fisher", total_kills = 2100 },
	{ name = "Gillian", total_kills = 3500 },
	{ name = "Demonic Hollow", total_kills = 4000 },
	{ name = "Fraccion", total_kills = 4000 },
	{ name = "Quincy", total_kills = 4000 },
	{ name = "Jagdarmee", total_kills = 5000 },
	{ name = "Barragan Soldier", total_kills = 2500 },
	{ name = "Espada", total_kills = 5000 },
	{ name = "Incomplete Arrancar", total_kills = 7000 },
	{ name = "Arrancar Watcher", total_kills = 3000 },
	{ name = "Nnoitra", total_kills = 7000 },
	{ name = "Arrancar Hollow", total_kills = 5000 },
	{ name = "Adjuchas", total_kills = 5000 },
	{ name = "Grown Hollow", total_kills = 10000 }
}

function onCreatureSay(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	msg = msg:lower()

	if not npcHandler:isFocused(cid) and getDistanceBetween(getThingPos(cid), getNpcPos()) < 5 then
		if isInArray({ "hi", "hello", "oi", "olá" }, msg) then
			local player_name = getCreatureName(cid)
			talkState[talkUser] = nil
			selfSayMultiLanguage(
				"Hello, " .. player_name .. "! I can give you some {tasks}. If you complete them all I guarantee you a good reward."
				,
				"Olá, " ..
				player_name ..
				"! Eu posso te passar algumas {tarefas}. Se você completar todas elas eu te garanto uma boa recompensa.",
				cid
			)
			npcHandler:addFocus(cid)
			return true
		end
	end

	if isInArray({ "bye", "goodbye", "tchau", "adeus" }, msg) and npcHandler:isFocused(cid) then
		selfSayMultiLanguage(
			"Goodbye!",
			"Adeus!",
			cid
		)
		npcHandler:releaseFocus(cid)
		return true
	end

	if (not npcHandler:isFocused(cid)) then
		return false
	end

	if isInArray({ "tasks", "tarefas" }, msg) then
		local player_task = getCreatureStorage(cid, "yamamoto_task")
		local player_task_kills = getCreatureStorage(cid, "yamamoto_task_kills")
		local player_task_monster = getCreatureStorage(cid, "yamamoto_task_monster")

		if player_task_monster == 0 then
			selfSayMultiLanguage(
				"Do you accept start your tasks defeating " .. task_monsters[player_task + 1].total_kills .. " " .. task_monsters[player_task + 1].name .. "s?",
				"Você aceita começar as suas tarefas derrotando " .. task_monsters[player_task + 1].total_kills .. " " .. task_monsters[player_task + 1].name .. "s?",
				cid
			)
			talkState[talkUser] = 1
			return true
		end

		if player_task_kills >= task_monsters[player_task].total_kills then
			selfSayMultiLanguage(
				"Have you already defeated " .. task_monsters[player_task].total_kills .. " " .. task_monsters[player_task].name .. "s?",
				"Você já derrotou " .. task_monsters[player_task].total_kills .. " " .. task_monsters[player_task].name .. "s?",
				cid
			)
			talkState[talkUser] = 2
			return true
		end

		selfSayMultiLanguage(
			"You've already accepted a task. You have to defeat " .. (task_monsters[player_task].total_kills - player_task_kills) .. " " .. task_monsters[player_task].name .. "s.",
			"Você já aceitou uma tarefa. Você tem que derrotar " .. (task_monsters[player_task].total_kills - player_task_kills) .. " " .. task_monsters[player_task].name .. "s.",
			cid
		)
		return true
	end

	if talkState[talkUser] == nil then
		return true
	end

	if isInArray({ "yes", "sim" }, msg) and talkState[talkUser] >= 1 then
		local player_task = getPlayerStorageValue(cid, "yamamoto_task")
		local player_task_kills = getPlayerStorageValue(cid, "yamamoto_task_kills")

		if talkState[talkUser] == 1 then
			selfSayMultiLanguage(
				"You've started your tasks. When you defeat " .. task_monsters[player_task + 1].total_kills .. " " .. task_monsters[player_task + 1].name .. "s come to talk with me again.",
				"Você iniciou suas tarefas. Quando você derrotar " .. task_monsters[player_task + 1].total_kills .. " " .. task_monsters[player_task + 1].name .. "s venha falar comigo novamente.",
				cid
			)

			setPlayerStorageValue(cid, "yamamoto_task_kills", 0)
			setPlayerStorageValue(cid, "yamamoto_task", player_task + 1)
			setPlayerStorageValue(cid, "yamamoto_task_monster", task_monsters[player_task + 1].name)
			setPlayerStorageValue(cid, "yamamoto_task_total_kills", task_monsters[player_task + 1].total_kills)
			npcHandler:releaseFocus(cid)
			return true
		end

		if talkState[talkUser] == 2 then
			if player_task_kills >= task_monsters[player_task].total_kills then
				if player_task == #task_monsters then
					setPlayerStorageValue(cid, "extra_life", getPlayerStorageValue(cid, "extra_life") + 10000)
					doPlayerFormula(cid)
					npcHandler:releaseFocus(cid)
					return true
				end

				selfSayMultiLanguage(
					"You have finished the task. Your next is " ..
					task_monsters[player_task + 1].total_kills .. " " .. task_monsters[player_task + 1].name .. "s.",
					"Você terminou a tarefa. A sua próxima é derrotar " ..
					task_monsters[player_task + 1].total_kills .. " " .. task_monsters[player_task + 1].name .. "s.",
					cid
				)

				setPlayerStorageValue(cid, "yamamoto_task", player_task + 1)
				setPlayerStorageValue(cid, "yamamoto_task_kills", nil)
				setPlayerStorageValue(cid, "yamamoto_task_monster", task_monsters[player_task + 1].name)
				setPlayerStorageValue(cid, "yamamoto_task_total_kills", task_monsters[player_task + 1].total_kills)
				npcHandler:releaseFocus(cid)
				return true
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
