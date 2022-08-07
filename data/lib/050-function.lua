function isInArray(array, value, caseSensitive)
	if (caseSensitive == nil or caseSensitive == false) and type(value) == "string" then
		local lowerValue = value:lower()
		for _, _value in ipairs(array) do
			if type(_value) == "string" and lowerValue == _value:lower() then
				return true
			end
		end
	else
		for _, _value in ipairs(array) do
			if (value == _value) then return true end
		end
	end

	return false
end

function doPlayerGiveItem(cid, itemid, amount, subType)
	local item = 0
	if (isItemStackable(itemid)) then
		item = doCreateItemEx(itemid, amount)
		if (doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	else
		for i = 1, amount do
			item = doCreateItemEx(itemid, subType)
			if (doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
				return false
			end
		end
	end

	return true
end

function doPlayerGiveItemContainer(cid, containerid, itemid, amount, subType)
	for i = 1, amount do
		local container = doCreateItemEx(containerid, 1)
		for x = 1, getContainerCapById(containerid) do
			doAddContainerItem(container, itemid, subType)
		end

		if (doPlayerAddItemEx(cid, container, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	end

	return true
end

function doPlayerTakeItem(cid, itemid, amount)
	return getPlayerItemCount(cid, itemid) >= amount and doPlayerRemoveItem(cid, itemid, amount)
end

function doPlayerSellItem(cid, itemid, count, cost)
	if (not doPlayerTakeItem(cid, itemid, count)) then
		return false
	end

	if (not doPlayerAddMoney(cid, cost)) then
		error('[doPlayerSellItem] Could not add money to: ' .. getPlayerName(cid) .. ' (' .. cost .. 'gp).')
	end

	return true
end

function doPlayerWithdrawMoney(cid, amount)
	if (not getBooleanFromString(getConfigInfo('bankSystem'))) then
		return false
	end

	local balance = getPlayerBalance(cid)
	if (amount > balance or not doPlayerAddMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, balance - amount)
	return true
end

function doPlayerDepositMoney(cid, amount)
	if (not getBooleanFromString(getConfigInfo('bankSystem'))) then
		return false
	end

	if (not doPlayerRemoveMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, getPlayerBalance(cid) + amount)
	return true
end

function doPlayerAddStamina(cid, minutes)
	return doPlayerSetStamina(cid, getPlayerStamina(cid) + minutes)
end

function isPremium(cid)
	return (isPlayer(cid) and (getPlayerPremiumDays(cid) > 0 or getBooleanFromString(getConfigValue('freePremium'))))
end

function getMonthDayEnding(day)
	if (day == "01" or day == "21" or day == "31") then
		return "st"
	elseif (day == "02" or day == "22") then
		return "nd"
	elseif (day == "03" or day == "23") then
		return "rd"
	end

	return "th"
end

function getMonthString(m)
	return os.date("%B", os.time { year = 1970, month = m, day = 1 })
end

function getArticle(str)
	return str:find("[AaEeIiOoUuYy]") == 1 and "an" or "a"
end

function doNumberFormat(i)
	local str, found = string.gsub(i, "(%d)(%d%d%d)$", "%1,%2", 1), 0
	repeat
		str, found = string.gsub(str, "(%d)(%d%d%d),", "%1,%2,", 1)
	until found == 0
	return str
end

function doPlayerAddAddons(cid, addon)
	for i = 0, table.maxn(maleOutfits) do
		doPlayerAddOutfit(cid, maleOutfits[i], addon)
	end

	for i = 0, table.maxn(femaleOutfits) do
		doPlayerAddOutfit(cid, femaleOutfits[i], addon)
	end
end

function getTibiaTime(num)
	local minutes, hours = getWorldTime(), 0
	while (minutes > 60) do
		hours = hours + 1
		minutes = minutes - 60
	end

	if (num) then
		return { hours = hours, minutes = minutes }
	end

	return { hours = hours < 10 and '0' .. hours or '' .. hours, minutes = minutes < 10 and '0' .. minutes or '' .. minutes }
end

function doWriteLogFile(file, text)
	local f = io.open(file, "a+")
	if (not f) then
		return false
	end

	f:write("[" .. os.date("%d/%m/%Y %H:%M:%S") .. "] " .. text .. "\n")
	f:close()
	return true
end

function getExperienceForLevel(lv)
	lv = lv - 1
	return ((50 * lv * lv * lv) - (150 * lv * lv) + (400 * lv)) / 3
end

function doMutePlayer(cid, time, sub)
	local condition = createConditionObject(CONDITION_MUTED, (time == -1 and time or time * 1000))
	if (type(sub) == 'number') then
		setConditionParam(condition, CONDITION_PARAM_SUBID, sub, false)
	end

	return doAddCondition(cid, condition, false)
end

function doPlayerDispelCondition(cid, dispelCondition)
	local condition = createConditionObject(CONDITION_NONE)
	setConditionParam(condition, COMBAT_PARAM_DISPEL, dispelCondition)

	return doAddCondition(cid, condition, false)
end

function doSummonCreature(name, pos)
	local cid = doCreateMonster(name, pos, false, false)
	if (not cid) then
		cid = doCreateNpc(name, pos)
	end

	return cid
end

function getPlayersOnlineEx()
	local players = {}
	for i, cid in ipairs(getPlayersOnline()) do
		table.insert(players, getCreatureName(cid))
	end

	return players
end

function getPlayerByName(name)
	local cid = getCreatureByName(name)
	return isPlayer(cid) and cid or nil
end

function isPlayer(cid)
	return isCreature(cid) and cid >= AUTOID_PLAYERS and cid < AUTOID_MONSTERS
end

function isPlayerGhost(cid)
	return isPlayer(cid) and
		(
		getCreatureCondition(cid, CONDITION_GAMEMASTER, GAMEMASTER_INVISIBLE, CONDITIONID_DEFAULT) or
			getPlayerFlagValue(cid, PLAYERFLAG_CANNOTBESEEN))
end

function isMonster(cid)
	return isCreature(cid) and cid >= AUTOID_MONSTERS and cid < AUTOID_NPCS
end

function isNpc(cid)
	-- Npc IDs are over int32_t range (which is default for lua_pushnumber),
	-- therefore number is always a negative value.
	return isCreature(cid) and (cid < 0 or cid >= AUTOID_NPCS)
end

function isUnderWater(cid)
	return isInArray(underWater, getTileInfo(getCreaturePosition(cid)).itemid)
end

function doPlayerAddLevel(cid, amount, round)
	local experience, level, amount = 0, getPlayerLevel(cid), amount or 1
	if (amount > 0) then
		experience = getExperienceForLevel(level + amount) -
			(round and getPlayerExperience(cid) or getExperienceForLevel(level))
	else
		experience = -
			((round and getPlayerExperience(cid) or getExperienceForLevel(level)) - getExperienceForLevel(level + amount))
	end

	return doPlayerAddExperience(cid, experience)
end

function doPlayerAddMagLevel(cid, amount)
	local amount = amount or 1
	for i = 1, amount do
		doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true) + 1) - getPlayerSpentMana(cid), false)
	end

	return true
end

function doPlayerAddSkill(cid, skill, amount, round)
	local amount = amount or 1
	if (skill == SKILL__LEVEL) then
		return doPlayerAddLevel(cid, amount, round)
	elseif (skill == SKILL__MAGLEVEL) then
		return doPlayerAddMagLevel(cid, amount)
	end

	for i = 1, amount do
		doPlayerAddSkillTry(cid, skill,
			getPlayerRequiredSkillTries(cid, skill, getPlayerSkillLevel(cid, skill) + 1) - getPlayerSkillTries(cid, skill), false)
	end

	return true
end

function isPrivateChannel(channelId)
	return channelId >= CHANNEL_PRIVATE
end

function doBroadcastMessage(text, class)
	local class = class or MESSAGE_STATUS_WARNING
	if (type(class) == 'string') then
		local className = MESSAGE_TYPES[class]
		if (className == nil) then
			return false
		end

		class = className
	elseif (class < MESSAGE_FIRST or class > MESSAGE_LAST) then
		return false
	end

	for _, pid in ipairs(getPlayersOnline()) do
		doPlayerSendTextMessage(pid, class, text)
	end

	print("> Broadcasted message: \"" .. text .. "\".")
	return true
end

function doPlayerBroadcastMessage(cid, text, class, checkFlag, ghost)
	local checkFlag, ghost, class = checkFlag or true, ghost or false, class or TALKTYPE_BROADCAST
	if (checkFlag and not getPlayerFlagValue(cid, PLAYERFLAG_CANBROADCAST)) then
		return false
	end

	if (type(class) == 'string') then
		local className = TALKTYPE_TYPES[class]
		if (className == nil) then
			return false
		end

		class = className
	elseif (class < TALKTYPE_FIRST or class > TALKTYPE_LAST) then
		return false
	end

	for _, pid in ipairs(getPlayersOnline()) do
		doCreatureSay(cid, text, class, ghost, pid)
	end

	print("> " .. getCreatureName(cid) .. " broadcasted message: \"" .. text .. "\".")
	return true
end

function doCopyItem(item, attributes)
	local attributes = ((type(attributes) == 'table') and attributes or { "aid" })

	local ret = doCreateItemEx(item.itemid, item.type)
	for _, key in ipairs(attributes) do
		local value = getItemAttribute(item.uid, key)
		if (value ~= nil) then
			doItemSetAttribute(ret, key, value)
		end
	end

	if (isContainer(item.uid)) then
		for i = (getContainerSize(item.uid) - 1), 0, -1 do
			local tmp = getContainerItem(item.uid, i)
			if (tmp.itemid > 0) then
				doAddContainerItemEx(ret, doCopyItem(tmp, attributes).uid)
			end
		end
	end

	return getThing(ret)
end

function doSetItemText(uid, text, writer, date)
	local thing = getThing(uid)
	if (thing.itemid < 100) then
		return false
	end

	doItemSetAttribute(uid, "text", text)
	if (writer ~= nil) then
		doItemSetAttribute(uid, "writer", tostring(writer))
		if (date ~= nil) then
			doItemSetAttribute(uid, "date", tonumber(date))
		end
	end

	return true
end

function getItemWeightById(itemid, count, precision)
	local item, count, precision = getItemInfo(itemid), count or 1, precision or false
	if (not item) then
		return false
	end

	if (count > 100) then
		-- print a warning, as its impossible to have more than 100 stackable items without "cheating" the count
		print('[Warning] getItemWeightById', 'Calculating weight for more than 100 items!')
	end

	local weight = item.weight * count
	return precission and weight or math.round(weight, 2)
end

function choose(...)
	local arg = { ... }
	return arg[math.rand(1, table.maxn(arg))]
end

function doPlayerAddExpEx(cid, amount)
	if (not doPlayerAddExp(cid, amount)) then
		return false
	end

	local position = getThingPosition(cid)
	doPlayerSendTextMessage(cid, MESSAGE_EXPERIENCE, "You gained " .. amount .. " experience.", amount, COLOR_WHITE,
		position)

	local spectators, name = getSpectators(position, 7, 7), getCreatureName(cid)
	for _, pid in ipairs(spectators) do
		if (isPlayer(pid) and cid ~= pid) then
			doPlayerSendTextMessage(pid, MESSAGE_EXPERIENCE_OTHERS, name .. " gained " .. amount .. " experience.", amount,
				COLOR_WHITE, position)
		end
	end

	return true
end

function getItemTopParent(uid)
	local parent = getItemParent(uid)
	if (not parent or parent.uid == 0) then
		return nil
	end

	for i = 1, 1000 do
		local tmp = getItemParent(parent.uid)
		if (tmp and tmp.uid ~= 0 and (not parent or parent.uid == 0 or tmp.uid ~= parent.uid)) then
			parent = tmp
		else
			break
		end
	end

	return parent
end

function getItemHolder(uid)
	local parent = getItemParent(uid)
	if (not parent or parent.uid == 0) then
		return nil
	end

	local holder = nil
	for i = 1, 1000 do
		local tmp = getItemParent(parent.uid)
		if (tmp and tmp.uid ~= 0 and (not parent or parent.uid == 0 or tmp.uid ~= parent.uid)) then
			if (tmp.itemid == 1) then -- a creature
				holder = tmp
				break
			end

			parent = tmp
		else
			break
		end
	end

	return holder
end

function valid(f)
	return function(p, ...)
		if (isCreature(p)) then
			return f(p, ...)
		end
	end
end

function addContainerItems(container, items)
	local items_mod = {}
	for _, it in ipairs(items) do
		if (isItemStackable(it.id) and it.count > 100) then
			local c = it.count
			while (c > 100) do
				table.insert(items_mod, { id = it.id, count = 100 })
				c = c - 100
			end
			if (c > 0) then
				table.insert(items_mod, { id = it.id, count = c })
			end
		else
			table.insert(items_mod, { id = it.id, count = 1 })
		end
	end

	local free = getContainerCap(container.uid) - (getContainerSize(container.uid))
	local count = math.ceil(#items_mod / free)
	local main_bp = container.uid
	local insert_bp = main_bp
	local counter = 1
	for c, it in ipairs(items_mod) do
		local _c = isItemStackable(it.id) and (it.count > 100 and 100 or it.count) or 1
		if count > 1 then
			if (counter < free) then
				doAddContainerItem(insert_bp, it.id, _c)
			else
				insert_bp = doAddContainerItem(insert_bp, container.itemid, 1)
				count = (#items_mod) - (free - 1)
				free = getContainerCap(insert_bp)
				count = math.ceil(count / free)
				doAddContainerItem(insert_bp, it.id, _c)
				counter = 1
			end
			counter = counter + 1
		else
			doAddContainerItem(insert_bp, it.id, _c)
		end
	end

	return main_bp
end

function getContainerItemCount(uid, itemid, recursive)
	local c, s = 0, getContainerSize(uid)
	for i = 1, s do
		local thing = getContainerItem(uid, (i - 1))
		if (thing.uid ~= 0) then
			if (recursive and isContainer(thing.uid)) then
				c = c + getContainerItemCount(thing.uid, itemid, recursive)
			end

			if (thing.itemid == itemid) then
				c = c + thing.type
			end
		end
	end

	return c
end

function getContainerItems(uid, itemid, recursive)
	local a, s = {}, getContainerSize(uid)
	for i = 1, s do
		local thing = getContainerItem(uid, (i - 1))
		if (thing.uid ~= 0) then
			if (recursive and isContainer(thing.uid)) then
				a = table.merge(a, getContainerItems(thing.uid, itemid, true))
			end

			if (thing.itemid == itemid) then
				table.insert(a, thing)
			end
		end
	end

	return a
end

-- Focus Save
function doPlayerSaveEx(cid)
	doCreatureSetStorage(cid, "save")
	local result = doPlayerSave(cid)
	doCreatureSetStorage(cid, "save", (os.time() + math.random(30, 90)))
	return result
end

-- Focus Save

function doPlayerBuyItem(cid, itemid, count, cost, charges)
	return doPlayerRemoveMoneyEx(cid, cost) and doPlayerGiveItem(cid, itemid, count, charges)
end

function doPlayerBuyItemContainer(cid, containerid, itemid, count, cost, charges)
	return doPlayerRemoveMoneyEx(cid, cost) and doPlayerGiveItemContainer(cid, containerid, itemid, count, charges)
end

function isRookie(cid, promoted)
	local arr = { 0 }
	if (promoted) then
		table.remove(arr, 1)
	end

	return isInArray(arr, getPlayerVocation(cid))
end

function doGenerateCode()
	local chars = {}
	for i = 1, 8 do
		local tmp = math.rand(1, (i == 1 and 2 or 3))
		if (tmp == 1) then
			table.insert(chars, math.rand(65, 90))
		elseif (tmp == 2) then
			table.insert(chars, math.rand(97, 122))
		else
			table.insert(chars, math.rand(48, 57))
		end
	end

	return string.format("%c%c%c%c%c%c%c%c", chars[1], chars[2], chars[3], chars[4], chars[5], chars[6], chars[7], chars[8])
end

function randomChance(percent)
	assert(percent >= 0 and percent <= 100)
	return percent >= math.random(1, 100)
end

function isPathable(cid, pos, ignoreCreatures)
	pos.stackpos = 0
	if getTileThingByPos(pos).uid ~= 0 then
		pos.stackpos = 253
		if ignoreCreatures == true then
			if doTileQueryAdd(cid, pos, 4) == RETURNVALUE_NOERROR then
				return true
			end
		else
			if getTopCreature(pos).uid == 0 and doTileQueryAdd(cid, pos) == RETURNVALUE_NOERROR then
				return true
			end
		end
	end
	return false
end

function format_seconds(seconds)
	return math.floor(seconds / 60) .. ":" .. (seconds % 60)
end

function disp_time(time)
	local hours = math.floor(math.mod(time, 86400) / 3600)
	local minutes = math.floor(math.mod(time, 3600) / 60)
	local seconds = math.floor(math.mod(time, 60))

	return { hours = hours, minutes = minutes, seconds = seconds }
end

function getFormatedTime(cid, time)
	local player_language = getPlayerStorageValue(cid, "language")
	local string = ""

	if time.hours > 0 then
		string = time.hours

		if time.hours > 1 then
			if player_language == "en" then
				string = string .. " hours"
			else
				string = string .. " horas"
			end
		else
			if player_language == "en" then
				string = string .. " hour"
			else
				string = string .. " hora"
			end
		end
	end

	if time.minutes > 0 then
		if time.hours > 0 then
			string = string .. ", "
		end

		string = string .. time.minutes

		if time.minutes > 1 then
			if player_language == "en" then
				string = string .. " minutes"
			else
				string = string .. " minutos"
			end
		else
			if player_language == "en" then
				string = string .. " minute"
			else
				string = string .. " minuto"
			end
		end
	end

	if time.seconds > 0 then
		if time.minutes > 0 then
			if player_language == "en" then
				string = string .. " and "
			else
				string = string .. " e "
			end
		end

		string = string .. time.seconds

		if time.seconds > 1 then
			if player_language == "en" then
				string = string .. " seconds"
			else
				string = string .. " segundos"
			end
		else
			if player_language == "en" then
				string = string .. " second"
			else
				string = string .. " segundo"
			end
		end
	end

	return string
end

function doPlayerFormula(cid)
	local player_level = getPlayerLevel(cid)
	local player_vocation = getPlayerVocation(cid)

	-- Health
	local extra_life = getPlayerStorageValue(cid, "extra_life")
	local formula_health = (player_level * getVocationInfo(player_vocation).healthGain) + extra_life
	if getCreatureMaxHealth(cid) ~= formula_health then
		setCreatureMaxHealth(cid, formula_health)
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
	end

	-- Mana
	local formula_mana = (player_level * getVocationInfo(player_vocation).manaGain)
	if getCreatureMaxMana(cid) ~= formula_mana then
		setCreatureMaxMana(cid, formula_mana)
		doCreatureAddMana(cid, getCreatureMaxMana(cid))
	end
	return true
end

function doRemoveItemIdFromPosition(id, n, position)
	local thing = getTileItemById(position, id)
	if (thing.itemid < 101) then
		return false
	end

	doRemoveItem(thing.uid, n)
	return true
end

function doRemoveCreatureSummons(cid)
	for _, summon in ipairs(getCreatureSummons(cid)) do
		doSendMagicEffect(getCreaturePosition(summon), CONST_ME_POFF)
		doRemoveCreature(summon)
	end
	return true
end

function doSendTutorialArrow(cid, position, storage_key, storage_value, secondary_position)
	if not isCreature(cid) then
		return
	end

	if getCreatureStorage(cid, storage_key) ~= storage_value then
		return
	end

	local creaturePosition = getCreaturePosition(cid)
	local targetPosition = position

	if creaturePosition.z ~= position.z then
		if secondary_position == nil then
			addEvent(doSendTutorialArrow, 3000, cid, position, storage_key, storage_value, secondary_position)
			return
		end

		targetPosition = secondary_position
	end

	if doComparePositions(creaturePosition, targetPosition) then
		addEvent(doSendTutorialArrow, 3000, cid, position, storage_key, storage_value, secondary_position)
		return
	end

	if getDistanceBetween(creaturePosition, targetPosition) <= 7 then
		doSendMagicEffect(targetPosition, 517, cid)
		addEvent(doSendTutorialArrow, 1200, cid, position, storage_key, storage_value, secondary_position)
		return
	end

	local positionDifference = {
		x = creaturePosition.x - targetPosition.x,
		y = creaturePosition.y - targetPosition.y,
		z = creaturePosition.z - targetPosition.z
	}

	local maxPositionDifference = math.max(math.abs(positionDifference.x), math.abs(positionDifference.y))
	local direction = -1

	if maxPositionDifference >= 5 then
		local positionTangent = positionDifference.x ~= 0 and positionDifference.y / positionDifference.x or 10
		if math.abs(positionTangent) < 0.4142 then
			direction = positionDifference.x > 0 and WEST or EAST
		elseif math.abs(positionTangent) < 2.4142 then
			direction = positionTangent > 0 and (positionDifference.y > 0 and NORTHWEST or SOUTHEAST) or
				positionDifference.x > 0 and SOUTHWEST or NORTHEAST
		else
			direction = positionDifference.y > 0 and NORTH or SOUTH
		end
	end

	local incrementX = 0
	local incrementY = 0

	if table.contains({ SOUTH, SOUTHEAST, SOUTHWEST }, direction) then
		incrementY = 5
	end

	if table.contains({ EAST, NORTHEAST, SOUTHEAST }, direction) then
		incrementX = 7
	end

	if table.contains({ WEST, NORTHWEST, SOUTHWEST }, direction) then
		incrementX = -7
	end

	if table.contains({ NORTH, NORTHEAST, NORTHWEST }, direction) then
		incrementY = -5
	end

	doSendDistanceShoot(creaturePosition, {
		x = creaturePosition.x + incrementX,
		y = creaturePosition.y + incrementY,
		z = creaturePosition.z
	}, 62, cid)

	addEvent(doSendTutorialArrow, 3000, cid, position, storage_key, storage_value, secondary_position)
end
