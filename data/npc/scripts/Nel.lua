local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg:lower()) end

function onThink() npcHandler:onThink() end

function onThink() npcHandler:onThinkCreatureSay() end

local initial_position = { x = 3263, y = 2675, z = 7 }
local destination = { x = 3263, y = 2714, z = 7 }
local runuganga_position = { x = 3263, y = 2710, z = 7 }
local menus_florest_position = { x = 3203, y = 2812, z = 15 }

local function getToDestination(cid, destination, dir)
	local cid_position = getCreaturePosition(cid)

	if isInArray({ WEST, EAST }, dir) and cid_position.x == destination.x or
		isInArray({ NORTH, SOUTH }, dir) and cid_position.y == destination.y then
		doCreatureSetStorage(cid, "walking", nil)
		addEvent(function()
			if getCreatureStorage(cid, "focus") > 1 then
				doCreatureSetStorage(cid, "focus", nil)
				getToDestination(cid, initial_position, NORTH)
			end
		end, 15000)
		return
	end

	doCreatureSetStorage(cid, "walking", 1)
	doMoveCreature(cid, dir)

	addEvent(getToDestination, 300, cid, destination, dir)
end

function onCreatureSay(cid, type, msg)
	if getCreatureStorage(cid, "menus_florest_access") == 1 then
		return
	end

	local npc_id = getNpcId()

	if getCreatureStorage(npc_id, "walking") == 1 then
		return
	end

	local focus_storage = getCreatureStorage(npc_id, "focus")

	if focus_storage ~= 0 and focus_storage ~= cid then
		return
	end

	msg = msg:lower()

	if not npcHandler:isFocused(cid) and getDistanceBetween(getThingPos(cid), getNpcPos()) < 5 then
		if isInArray({ "hi", "hello", "oi", "olá" }, msg) then
			if focus_storage == cid then
				doCreatureSetStorage(npc_id, "focus", nil)
				doCreatureSetStorage(npc_id, "walking", 1)

				selfSayMultiLanguage(
					"That's evil! If you were playing with Nel's feelings, you should have killed Nel. It would have been a lot less painful!",
					"Isso é maldade! Se tava brincando com os sentimentos da Nel, devia ter matadado a Nel. Teria sido bem menos doloroso!",
					cid
				)

				addEvent(function()
					local teleport_position = { x = runuganga_position.x, y = runuganga_position.y + 2, z = runuganga_position.z }
					local runuganga = doCreateNpc("Runuganga", runuganga_position, false, true)

					if isCreature(cid) then
						doTeleportThing(cid, teleport_position)
						doCreatureSetNoMove(cid, true)

						addEvent(function()
							if isCreature(cid) then
								MultiLanguage.doCreatureSay(
									runuganga,
									cid,
									"I protect Las Noches from intruders. You will be punished!",
									"Eu sou o encarregado de proteger Las Noches de intrusos. Você será castigado!"
								)
							end
						end, 2500)

						local effects = { 319, 504 }

						addEvent(function ()
							if not isCreature(cid) then
								return
							end

							for i = 0, 9 do
								addEvent(function()
									for i = 1, 30 do
										doSendMagicEffect({
											x = teleport_position.x + math.random(-7, 7),
											y = teleport_position.y + math.random(-7, 7),
											z = teleport_position.z
										}, effects[math.random(1, 2)])
									end
								end, 400 * i)
							end
						end, 6000)
					end

					addEvent(function()
						getToDestination(npc_id, initial_position, NORTH)

						if isCreature(runuganga) then
							doRemoveCreature(runuganga)
						end

						if not isCreature(cid) then
							return
						end

						doTeleportThing(cid, menus_florest_position)
						doSendMagicEffect({
							x = menus_florest_position.x + 1,
							y = menus_florest_position.y,
							z = menus_florest_position.z
						}, 111)

						doCreatureSetNoMove(cid, false)
						doCreatureSetStorage(cid, "menus_florest_access", 1)

						MultiLanguage.doPlayerSendTextMessage(
							cid,
							MESSAGE_EVENT_ADVANCE,
							"You have irritated Runuganga, the Las Noches protector, so, he made a sand swirl causing you to fall in the Menus Florest. Now you can get to this florest by yourself.",
							"Você irritou Runuganga, o protetor de Las Noches, então, ele fez um redemoinho de areia fazendo com que você caia na Floresta dos Menus. Agora você pode ir até essa floresta por conta própria."
						)
					end, 10000)
				end, 3000)
				return true
			end

			selfSayMultiLanguage(
				"Hello! Let's play endless tag?",
				"Olá! Vamos brincar de pega-pega sem fim?",
				cid
			)
			npcHandler:addFocus(cid)
		end
		return true
	end

	if (not npcHandler:isFocused(cid)) then
		return false
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

	if isInArray({ "yes", "sim" }, msg) then
		selfSayMultiLanguage(
			"Then try to reach me!",
			"Então tente me alcançar!",
			cid
		)

		getToDestination(npc_id, destination, SOUTH)
		doCreatureSetStorage(npc_id, "focus", cid)
		npcHandler:releaseFocus(cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
