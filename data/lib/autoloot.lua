AutoLoot = {
	directory = "data/logs/autoloot",
	Warn_Bp_Slots = 5, -- quando tiver 5 ou menos slots na BP vai avisar o jogador
	Talkaction_delay = 5, -- em segundos // delay para remover e adicionar item
	block_items = { 2123, 2515 },
	Money_ids = { 2148, 2152, 2160 }, -- id das moedas do ot
	max_slots = 20,
}

function isItemInAutolootList(cid, item)
	for _, i in pairs(getAutolootItems(cid)) do
		if tonumber(i) == tonumber(item) then
			return true
		end
	end
	return false
end

function doRemoveAutolootItem(cid, itemid)
	local file = io.open(AutoLoot.directory .. "/" .. getCreatureName(cid) .. ".log", 'r')
	local file_content = {}

	for line in file:lines() do
		if line ~= "" and tonumber(line) ~= tonumber(itemid) then
			file_content[#file_content + 1] = line
		end
	end

	io.close(file)

	file = io.open(AutoLoot.directory .. "/" .. getCreatureName(cid) .. ".log", 'w')
	for index, value in ipairs(file_content) do
		file:write(value .. '\n')
	end

	io.close(file)
end

function doAddAutolootItem(cid, itemid)
	if not existsAutoloot(cid) then
		doCreateLootUserName(cid, itemid)
		return true
	end

	local file = io.open(AutoLoot.directory .. "/" .. getCreatureName(cid) .. ".log", "a+")
	file:write('\n' .. itemid)
	file:close()
end

function existsAutoloot(cid)
	local f = io.open(AutoLoot.directory .. "/" .. getCreatureName(cid) .. ".log", "rb")
	if f then f:close() end
	return f ~= nil
end

function doCreateLootUserName(cid, itemid)
	local newFile = io.open(AutoLoot.directory .. "/" .. getCreatureName(cid) .. ".log", "w+")
	newFile:write(itemid)
	newFile:close()
end

function getAutolootItems(cid)
	if not existsAutoloot(cid) then
		return {}
	end

	local lines = {}

	for line in io.lines(AutoLoot.directory .. "/" .. getCreatureName(cid) .. ".log") do
		if line ~= "" then
			lines[#lines + 1] = tonumber(line)
		end
	end

	return lines
end

function doCleanAutoloot(cid)
	return os.remove(AutoLoot.directory .. "/" .. getCreatureName(cid) .. ".log")
end

function doSendAutoLootPopup(cid)
	local autoloot_list = getAutolootItems(cid)
	local autoloot_enabled = getCreatureStorage(cid, "autoloot") == 1
	local autoloot_money_enabled = getCreatureStorage(cid, "autoloot_money") == 1

	return MultiLanguage.doPlayerPopupFYI(
		cid,
		"Auto Loot System\n\n" ..
		"- Commands\n" ..
		"!autoloot <enable/disable> (Enable or disable the auto loot)\n" ..
		"!autoloot add, <item name> (Add an item to the list)\n" ..
		"!autoloot remove, <item name> (Remove an item in the list)\n" ..
		"!autoloot money (Enable or disable money collecting)\n" ..
		"!autoloot clear (Clear the auto loot list)\n" ..
		"!autoloot list (Show the items added to your auto loot list)\n\n" ..
		"- Info\n" ..
		"Status: " .. (autoloot_enabled and "enabled" or "disabled") .. "\n" ..
		"Money collecting: " .. (autoloot_money_enabled and "enabled" or "disabled") .. "\n" ..
		"Slots: [" .. #autoloot_list .. "/" .. AutoLoot.max_slots .. "]",
		"Auto Loot System\n\n" ..
		"- Comandos\n" ..
		"!autoloot <ativar/desativar> (Ativa ou desativa o auto loot)\n" ..
		"!autoloot adicionar, <nome do item> (Adiciona um item na lista)\n" ..
		"!autoloot remover, <nome do item> (Remove um item da lista)\n" ..
		"!autoloot dinheiro (Ativa ou desativa a coleta dinheiro)\n" ..
		"!autoloot limpar (Limpa a lista do auto loot)\n" ..
		"!autoloot lista (Mostra os itens adicionados à sua lista do auto loot)\n\n" ..
		"- Info\n" ..
		"Status: " .. (autoloot_enabled and "ativado" or "desativado") .. "\n" ..
		"Coleta de dinheiro: " .. (getCreatureStorage(cid, "autoloot_money") > 0 and "ativado" or "desativado") .. "\n" ..
		"Slots: [" .. #autoloot_list .. "/" .. AutoLoot.max_slots .. "]"
	)
end

function doSendAutoLootList(cid)
	local autoloot_list = getAutolootItems(cid)
	local str = "- Auto Loot List [" .. #autoloot_list .."/" .. AutoLoot.max_slots .. "]\n\n"

	if #autoloot_list > 0 then
		for i = 1, #autoloot_list do
			str = str .. getItemNameById(autoloot_list[i]) .. "\n"
		end
	end

	return doShowTextDialog(cid, 16331, str)
end

function getContainerItems(container, array, haveCap)
	array = array or {}
	haveCap = haveCap or false

	if not isContainer(container.uid) or getContainerSize(container.uid) == 0 then
		array[#array + 1] = container
	else
		local size = getContainerSize(container.uid)
		haveCap = (getContainerCap(container.uid) - size) > 0
		for slot = 0, (size - 1) do
			local item = getContainerItem(container.uid, slot)
			if item.itemid > 1 then
				getContainerItems(item, array, haveCap)
			end
		end
	end

	return #array >= 1 and array, haveCap
end

function getContainerItemsById(container, itemid)
	local founds = {}
	local items = not container.uid and container or getContainerItems(container)

	for _, item in pairs(items) do
		if item.itemid == itemid then
			founds[#founds + 1] = item
		end
	end

	return #founds >= 1 and founds
end

function getAllContainersFreeSlots(cid)
	local containers = {}
	local free_slots = 0

	for i = CONST_SLOT_FIRST, CONST_SLOT_LAST do
		local slot_item = getPlayerSlotItem(cid, i)

		if slot_item.uid > 0 then
			if isContainer(slot_item.uid) then
				table.insert(containers, slot_item.uid)
				free_slots = free_slots + getContainerFreeSlots(slot_item.uid)
			end
		end
	end

	while #containers > 0 do
		for i = (getContainerSize(containers[1]) - 1), 0, -1 do
			local container = getContainerItem(containers[1], i)

			if isContainer(container.uid) then
				table.insert(containers, container.uid)
				free_slots = free_slots + getContainerFreeSlots(container.uid)
			end
		end

		table.remove(containers, 1)
	end

	return free_slots
end

function getContainerFreeSlots(container)
	return getContainerCap(container) - getContainerSize(container)
end

function doPlayerAddItemStackable(cid, itemid, count)
	local container = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)

	if container.itemid <= 0 then
		return false
	end

	local items = getContainerItemsById(container, itemid)

	if not items then
		return doPlayerAddItem(cid, itemid, count)
	end

	local stacks = #items

	for _, item in pairs(items) do
		if item.type < 100 then
			local sum = item.type + count
			local result = doTransformItem(item.uid, itemid, sum)

			if sum <= 100 then
				return result
			end

			return doPlayerAddItem(cid, itemid, sum - 100)
		end

		stacks = stacks - 1

		if stacks == 0 then
			return doPlayerAddItem(cid, itemid, count)
		end
	end
	return false
end

function doLootCorpse(cid, pos)
	local corpse = false
	local slots = 0
	local tile

	for i = 0, 255 do
		pos.stackpos = i
		tile = getTileThingByPos(pos)
		if tile.uid > 0 and isCorpse(tile.uid) then
			corpse = true
			break
		end
	end

	if corpse then
		local loot_message = ""
		local container_items = getContainerItems(tile)

		if container_items then
			local list = getAutolootItems(cid)
			for _, item in pairs(container_items) do
				local id = item.itemid
				if #list > 0 and isInArray(list, id) or
					getCreatureStorage(cid, "autoloot_money") == 1 and isInArray(AutoLoot.Money_ids, id) then
					local info = getItemInfo(id)
					local amount = isItemStackable(id) and item.type or 1
					local total_cap = getItemWeight(item.uid) * amount
					slots = getAllContainersFreeSlots(cid)
					if slots > 0 and getPlayerFreeCap(cid) >= total_cap then
						if isItemStackable(id) then
							loot_message = loot_message .. " " .. amount .. " " .. (amount > 1 and info.plural or info.name) .. ","
							doPlayerAddItemStackable(cid, id, amount)
						else
							loot_message = loot_message .. " " .. info.article .. " " .. info.name .. ","
							doPlayerAddItem(cid, id)
						end
						doRemoveItem(item.uid)
					end
				end
			end

			if loot_message ~= "" then
				MultiLanguage.doPlayerSendChannelMessage(
					cid,
					"Auto Loot",
					TALKTYPE_GAMEMASTER_CHANNEL,
					10,
					"Collected" .. string.sub(loot_message, 1, -2) .. ".",
					"Coletado" .. string.sub(loot_message, 1, -2) .. "."
				)
			end

			if slots > 0 and slots <= AutoLoot.Warn_Bp_Slots then
				MultiLanguage.doPlayerSendChannelMessage(
					cid,
					"Auto Loot",
					TALKTYPE_GAMEMASTER_CHANNEL,
					10,
					"You have only " .. slots .. " slots free in your backpack!",
					"Você tem apenas " .. slots .. " slots na sua backpack!"
				)
			end
		end
	end
end

function existItemByName(name) -- by vodka
	local items = io.open("data/items/items.xml", "r"):read("*all")
	local get = items:lower():match('name="' .. name:lower() .. '"')

	return not (get == nil or get == "")
end
