local talkState = {}
local count = {}
local transfer = {}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function onThink() npcHandler:onThinkCreatureSay() end

local function isValidMoney(money)
	return (isNumber(money) and money > 0 and money < 4294967296)
end

local function getCount(string)
	local b, e = string:find("%d+")
	local money = b and e and tonumber(string:sub(b, e)) or -1
	if (isValidMoney(money)) then
		return money
	end
	return -1
end

function greetCallback(cid)
	talkState[cid], count[cid], transfer[cid], pin[cid] = 0, nil, nil, nil
	return true
end

function onCreatureSay(cid, type, msg)
	msg = msg:lower()

	if not npcHandler:isFocused(cid) and getDistanceBetween(getThingPos(cid), getNpcPos()) < 5 then
		if isInArray({ "hi", "hello", "oi", "olá" }, msg) then
			local player_name = getCreatureName(cid)
			talkState[cid] = nil
			selfSayMultiLanguage(
				"Welcome, " .. player_name .. "! How can I {help} you?",
				"Bem-vindo, " .. player_name .. "! Como eu posso te {ajudar}?",
				cid
			)
			npcHandler:addFocus(cid)
			return true
		end
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

	-- Help
	if isInArray({ "help", "ajudar" }, msg) then
		selfSayMultiLanguage(
			"I can check your {balance}. And also {deposit}, {withdraw} or {transfer} to another person.",
			"Eu posso checar o seu {saldo}. E também {depositar}, {sacar} ou {transferir} para outra pessoa.",
			cid
		)
		talkState[cid] = 0
		return true
	end

	-- Balance
	if isInArray({ "balance", "saldo" }, msg) then
		selfSayMultiLanguage(
			"Your balance is " .. getPlayerBalance(cid) .. " ryo.",
			"O seu saldo é " .. getPlayerBalance(cid) .. " ryo.",
			cid
		)
		talkState[cid] = 0
		return true
	end

	-- Deposit
	if isInArray({ "deposit all", "depositar tudo" }, msg) and getPlayerMoney(cid) > 0 then
		count[cid] = getPlayerMoney(cid) - getPlayerBalance(cid)

		if count[cid] < 1 then
			selfSayMultiLanguage(
				"You don't have any money to deposit in you inventory.",
				"Você não tem dinheiro no seu inventário.",
				cid
			)

			talkState[cid] = nil
			count[cid] = nil
			return true
		end

		if not isValidMoney(count[cid]) then
			selfSayMultiLanguage(
				"Sorry, but you can't deposit that much money.",
				"Desculpe, mas você não pode depositar tanto dinheiro..",
				cid
			)
			talkState[cid] = 0
			return false
		end

		selfSayMultiLanguage(
			"Do you really want to deposit " .. count[cid] .. " ryo?",
			"Você realmente deseja depositar " .. count[cid] .. " ryo?",
			cid
		)
		talkState[cid] = 2
		return true
	end

	if isInArray({ "deposit", "depositar" }, msg) then
		selfSayMultiLanguage(
			"How much would you like to deposit?",
			"Quanto você deseja depositar?",
			cid
		)
		talkState[cid] = 1
		return true
	end

	if talkState[cid] == 1 then
		count[cid] = getCount(msg)
		if isValidMoney(count[cid]) then
			selfSayMultiLanguage(
				"Do you really want to deposit " .. count[cid] .. " ryo?",
				"Você realmente deseja depositar " .. count[cid] .. " ryo?",
				cid
			)
			talkState[cid] = 2
		end
		return true
	end

	if talkState[cid] == 2 then
		if isInArray({ "yes", "sim" }, msg) then
			if not doPlayerDepositMoney(cid, count[cid]) then
				selfSayMultiLanguage(
					"You don\'t have enough money.",
					"Você não tem dinheiro suficiente",
					cid
				)
				talkState[cid] = 0
				return true
			end

			selfSayMultiLanguage(
				"It has been added " .. count[cid] .. " ryo to your balance. Now your balance is " .. getPlayerBalance(cid) .. " ryo.",
				"Foi adicionado " .. count[cid] .. " ryo ao seu saldo. O seu saldo agora é " .. getPlayerBalance(cid) .. " ryo.",
				cid
			)
			doPlayerSave(cid)
		end
		return true
	end

	-- Withdraw
	if isInArray({ "withdraw", "sacar" }, msg) then
		selfSayMultiLanguage(
			"How much would you like to withdraw?",
			"Quanto você deseja sacar?",
			cid
		)
		talkState[cid] = 6
		return true
	end

	if talkState[cid] == 6 then
		count[cid] = getCount(msg)
		if isValidMoney(count[cid]) then
			selfSayMultiLanguage(
				"Do you really want to withdraw " .. count[cid] .. " ryo?",
				"Você realmente deseja sacar " .. count[cid] .. " ryo?",
				cid
			)
			talkState[cid] = 7
		end
		return true
	end

	if talkState[cid] == 7 then
		if isInArray({ "yes", "sim" }, msg) then
			if not doPlayerWithdrawMoney(cid, count[cid]) then
				selfSay(
					"Sorry, you don't have enough money.",
					"Desculpe, você não tem dinheiro suficiente.",
					cid
				)
				talkState[cid] = 0
			else
				selfSayMultiLanguage(
					"There you go, " .. count[cid] .. " ryo.",
					"Aqui está, " .. count[cid] .. " ryo.",
					cid
				)
				talkState[cid] = 0
				doPlayerSave(cid)
			end
		end
		return true
	end

	-- Transfer
	if isInArray({ "transfer", "transferir" }) then
		selfSayMultiLanguage(
			"How much would you like to transfer?",
			"Quanto você deseja transferir?",
			cid
		)
		talkState[cid] = 11
		return true
	end

	if talkState[cid] == 11 then
		count[cid] = getCount(msg)
		if getPlayerBalance(cid) < count[cid] then
			selfSayMultiLanguage(
				"You don't have enough money.",
				"Você não tem dinheiro suficiente.",
				cid
			)
			talkState[cid] = 0
			return true
		end

		if isValidMoney(count[cid]) then
			selfSayMultiLanguage(
				"Who would you like to transfer " .. count[cid] .. " ryo to?",
				"Para quem você deseja transferir " .. count[cid] .. " ryo?",
				cid
			)
			talkState[cid] = 12
		end
		return true
	end

	if talkState[cid] == 12 then
		transfer[cid] = msg

		if getCreatureName(cid) == transfer[cid] then
			selfSayMultiLanguage(
				"Sorry, you can't transfer to yourself.",
				"Desculpe, você não pode transferir para você mesmo.",
				cid
			)
			talkState[cid] = 0
			return true
		end

		if playerExists(transfer[cid]) then
			selfSayMultiLanguage(
				"Do you really want to transfer " .. count[cid] .. " ryo to " .. transfer[cid] .. " ?",
				"Você realmente deseja transferir " .. count[cid] .. " ryo para " .. transfer[cid] .. " ?",
				cid
			)
			talkState[cid] = 13
		else
			selfSayMultiLanguage(
				"Player with name " .. transfer[cid] .. " doesn't exist.",
				"Jogador com o nome " .. transfer[cid] .. " não existe.",
				cid
			)
			talkState[cid] = 0
		end
		return true
	end

	if talkState[cid] == 13 then
		if msgcontains(msg, 'yes') then
			if not doPlayerTransferMoneyTo(cid, transfer[cid], count[cid]) then
				selfSayMultiLanguage(
					"This player doesn't exist.",
					"Esse jogador não existe.",
					cid
				)
			else
				selfSayMultiLanguage(
					"You've transferred " .. count[cid] .. " ryo to " .. transfer[cid] .. ".",
					"Você transferiu " .. count[cid] .. " ryo para " .. transfer[cid] .. ".",
					cid
				)
				transfer[cid] = nil
				doPlayerSave(cid)
			end
		end
		talkState[cid] = 0
		return true
	end

	-- TODO: money exchange

	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
