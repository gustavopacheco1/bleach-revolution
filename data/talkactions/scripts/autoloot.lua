function onSay(cid, words, param, channel)
	param = string.explode(param:lower(), ",")

	if table.contains({ "clear", "limpar" }, param[1]) then
		if not existsAutoloot(cid) then
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_STATUS_CONSOLE_BLUE,
				"[Auto Loot] Your auto loot list is already clean.",
				"[Auto Loot] Sua lista do auto loot já está limpa."
			)
			return true
		end

		doCleanAutoloot(cid)
		MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_STATUS_CONSOLE_BLUE,
			"[Auto Loot] Your auto loot list has been cleaned.",
			"[Auto Loot] Sua lista do auto loot foi limpa."
		)
		return true
	end

	if table.contains({ "enable", "ativar" }, param[1]) then
		if getCreatureStorage(cid, "autoloot") == 1 then
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_STATUS_CONSOLE_BLUE,
				"[Auto Loot] Your auto loot is already enabled.",
				"[Auto Loot] O seu auto loot já está ativado."
			)
			return true
		end

		doCreatureSetStorage(cid, "autoloot", 1)
		MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_STATUS_CONSOLE_BLUE,
			"[Auto Loot] Your auto loot has been enabled.",
			"[Auto Loot] O seu auto loot foi ativado."
		)
		return true
	end

	if table.contains({ "disable", "desativar" }, param[1]) then
		if getCreatureStorage(cid, "autoloot") == 0 then
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_STATUS_CONSOLE_BLUE,
				"[Auto Loot] Your auto loot is already disabled.",
				"[Auto Loot] O seu auto loot já está desativado."
			)
			return true
		end

		doCreatureSetStorage(cid, "autoloot", nil)
		MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_STATUS_CONSOLE_BLUE,
			"[Auto Loot] Your auto loot has been disabled.",
			"[Auto Loot] O seu auto loot foi desativado."
		)
		return true
	end

	if table.contains({ "money", "dinheiro", "ryo" }, param[1]) then
		if getCreatureStorage(cid, "autoloot_money") > 0 then
			doCreatureSetStorage(cid, "autoloot_money", nil)
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_STATUS_CONSOLE_BLUE,
				"[Auto Loot] Money collecting was disabled.",
				"[Auto Loot] Coleta de dinheiro foi desativada."
			)
			return true
		end

		doCreatureSetStorage(cid, "autoloot_money", 1)
		MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_STATUS_CONSOLE_BLUE,
			"[Auto Loot] Money collecting was enabled.",
			"[Auto Loot] Coleta de dinheiro foi ativada."
		)
		return true
	end

	if table.contains({ "list", "lista" }, param[1]) then
		doSendAutoLootList(cid)
		return true
	end

	if table.contains({ "add", "adicionar", "remove", "remover" }, param[1]) then
		local item = getItemIdByName(param[2])

		if not item then
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_STATUS_CONSOLE_BLUE,
				"This item does not exist. Did you write it correctly?",
				"Esse item não existe. Você digitou corretamente?"
			)
			return true
		end

		local item_name = getItemNameById(item)

		if table.contains({ "add", "adicionar" }, param[1]) then
			if table.contains(AutoLoot.Money_ids, item) then
				MultiLanguage.doPlayerSendTextMessage(
					cid, MESSAGE_FIRST,
					'[Auto Loot] Enter "!autoloot money" to add money in your auto loot list.',
					'[Auto Loot] Utilize "!autoloot dinheiro" para adicionar dinheiro na sua lista do auto loot.'
				)
				return true
			end

			if table.contains(AutoLoot.block_items, item) then
				MultiLanguage.doPlayerSendTextMessage(
					cid,
					MESSAGE_FIRST,
					'[Auto Loot] This item can not be added to the auto loot list.',
					'[Auto Loot] Esse item não pode ser adicionado na lista do auto loot.'
				)
				return true
			end

			if isItemInAutolootList(cid, item) then
				MultiLanguage.doPlayerSendTextMessage(
					cid,
					MESSAGE_STATUS_CONSOLE_BLUE,
					"[Auto Loot] " .. item_name .. " is already in your auto loot list.",
					"[Auto Loot] " .. item_name .. " já está na sua lista do auto loot."
				)
				return true
			end

			if #getAutolootItems(cid) >= AutoLoot.max_slots then
				MultiLanguage.doPlayerSendTextMessage(
					cid,
					MESSAGE_STATUS_CONSOLE_BLUE,
					"[Auto Loot] Your auto loot list has reached the maximum slots (" .. AutoLoot.max_slots .. ").",
					"[Auto Loot] Sua lista do auto loot atingiu o máximo de slots (" .. AutoLoot.max_slots .. ")."
				)
				return true
			end

			doAddAutolootItem(cid, item)
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_STATUS_CONSOLE_BLUE,
				"[Auto Loot] You added " .. item_name .. " to your auto loot list.",
				"[Auto Loot] Você adicionou " .. item_name .. " na sua lista do auto loot."
			)
			return true
		end

		if not isItemInAutolootList(cid, item) then
			MultiLanguage.doPlayerSendTextMessage(
				cid,
				MESSAGE_STATUS_CONSOLE_BLUE,
				"[Auto Loot] " .. item_name .. " is not in your auto loot list.",
				"[Auto Loot] " .. item_name .. " não está na sua lista do auto loot."
			)
			return true
		end

		doRemoveAutolootItem(cid, item)
		MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_STATUS_CONSOLE_BLUE,
			"[Auto Loot] You removed " .. item_name .. " from your auto loot list.",
			"[Auto Loot] Você removeu " .. item_name .. " da sua lista do auto loot."
		)
		return true
	end

	doSendAutoLootPopup(cid)
	return true
end
