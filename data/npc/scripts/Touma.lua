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

if (not getPlayerBalance) then
	getPlayerBalance = function(cid)
		local result = db.getResult("SELECT `balance` FROM `players` WHERE `id` = " .. getPlayerGUID(cid))
		if (result:getID() == -1) then
			return false
		end

		local value = tonumber(result:getDataString("balance"))
		result:free()
		return value
	end

	doPlayerSetBalance = function(cid, balance)
		db.executeQuery("UPDATE `players` SET `balance` = " .. balance .. " WHERE `id` = " .. getPlayerGUID(cid))
		return true
	end

	doPlayerWithdrawMoney = function(cid, amount)
		local balance = getPlayerBalance(cid)
		if (amount > balance or not doPlayerAddMoney(cid, amount)) then
			return false
		end

		doPlayerSetBalance(cid, balance - amount)
		return true
	end

	doPlayerDepositMoney = function(cid, amount)
		if (not doPlayerRemoveMoney(cid, amount, true)) then
			return false
		end

		doPlayerSetBalance(cid, getPlayerBalance(cid) + amount)
		return true
	end

	doPlayerTransferMoneyTo = function(cid, target, amount)
		local balance = getPlayerBalance(cid)
		if (amount > balance) then
			return false
		end

		local tid = getPlayerByName(target)
		if (tid > 0) then
			doPlayerSetBalance(tid, getPlayerBalance(tid) + amount)
		else
			if (playerExists(target) == false) then
				return false
			end

			db.executeQuery("UPDATE `player_storage` SET `value` = `value` + '" ..
				amount ..
				"' WHERE `player_id` = (SELECT `id` FROM `players` WHERE `name` = '" ..
				escapeString(player) .. "') AND `key` = '" .. balance_storage .. "'")
		end

		doPlayerSetBalance(cid, getPlayerBalance(cid) - amount)
		return true
	end
end

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
		if not isValidMoney(count[cid]) then
			selfSay("Sorry, but you can't deposit that much.", cid)
			talkState[cid] = 0
			return false
		end

		if count[cid] < 1 then
			selfSay("You don't have any money to deposit in you inventory..", cid)
			talkState[cid] = 0
		else
			selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
			talkState[cid] = 2
		end
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
					"You don\'t have enough gold.",
					"Você não tem ryo suficiente",
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
