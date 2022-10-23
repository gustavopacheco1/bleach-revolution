function onSay(cid, words, param)
	local t = string.explode(param, ",")

	if param == '' then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite o nome do jogador.")
		return true
	end

	if not isInArray({ "add", "remove" }, t[1]) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Add ou remove. Exemplo: /points add, Fulano, 30")
		return true
	end

	local player, balance, pid = getPlayerByName(t[2]), t[3], getPlayerByNameWildcard(t[2])

	if (not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O jogador n?o existe ou est? offline.")
		return true
	end

	if t[2] == null then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite a quantidade de pontos.")
		return true
	end

	local accountName = getPlayerAccount(player)
	local accountPoints = db.getResult("SELECT `premium_points` FROM `accounts` WHERE `name` = '" .. accountName .. "'")
	local points = tonumber(accountPoints:getDataInt("premium_points"))
	local name = getPlayerName(cid)

	if t[1] == "add" then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,
			"Voce adicionou " .. balance .. " premium points para o jogador " .. t[1] .. ".")
		MultiLanguage.doPlayerSendTextMessage(
			player,
			MESSAGE_STATUS_CONSOLE_ORANGE,
			"[Store] You've received " .. balance .. " premium points. Thanks for donating!",
			"[Store] Você recebeu " .. balance .. " premium points. Nós agradecemos pela doação!."

		)
		points = (points + balance)
		db.query("UPDATE `accounts` SET `premium_points` = " .. points .. " WHERE `name`='" .. accountName .. "'")
	end

	if t[1] == "remove" then
		points = (points - balance)
		if points <= 0 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce removeu todos os premium points do jogador " .. t[1] .. ".")
			db.query("UPDATE `accounts` SET `premium_points` = '0' WHERE `name`='" .. accountName .. "'")
			doPlayerSendTextMessage(
				player,
				MESSAGE_STATUS_CONSOLE_ORANGE,
				"[Store] All your premium points have been removed.",
				"[Store] Todos os seus premium points foram removidos."
			)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,
				"Voce removeu " .. balance .. " premium points do jogador " .. t[1] .. ".")
			db.query("UPDATE `accounts` SET `premium_points` = " .. points .. " WHERE `name`='" .. accountName .. "'")
			MultiLanguage.doPlayerSendTextMessage(
				player,
				MESSAGE_STATUS_CONSOLE_ORANGE,
				"[Store] " .. balance .. " premium points were removed from your account.",
				"[Store] " .. balance .. " foram removidos da sua conta."
			)
		end
	end

	return true
end
