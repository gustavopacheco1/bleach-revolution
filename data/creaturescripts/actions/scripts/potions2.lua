local config = {
	removeOnUse = "yes",
	usableOnTarget = "yes", -- can be used on target? (fe. healing friend)
	splashable = "no",
	range = -1,
	realAnimation = "no", -- make text effect visible only for players in range 1x1
	healthMultiplier = 1.0,
	manaMultiplier = 1.0
}

	config.removeOnUse = getBooleanFromString(config.removeOnUse)
	config.usableOnTarget = getBooleanFromString(config.usableOnTarget)
	config.splashable = getBooleanFromString(config.splashable)
	config.realAnimation = getBooleanFromString(config.realAnimation)

local POTIONS = {
	[2150] = {empty = 7478, splash = 2, health = {10000, 10500}}, -- heal medium potion
	[7477] = {empty = 7478, splash = 2, health = {50000, 55000}}, -- heal great potion
	[7443] = {empty = 7478, splash = 2, health = {4500, 5000}, -- heal potion
	[7591] = {empty = 7635, splash = 2, health = {500, 700}, level = 80, vocations = {4, 8}, vocStr = "knights"}, -- great health potion
	[8473] = {empty = 7635, splash = 2, health = {800, 1000}, level = 130, vocations = {4, 8}, vocStr = "knights"}, -- ultimate health potion

	[7440] = {empty = 7478, splash = 7, mana = {5000, 5500}}, -- chakra potion
	[2149] = {empty = 7478, splash = 7, mana = {10000, 10500}, -- strong chakra potion
	[2144] = {empty = 7478, splash = 7, mana = {50000, 55000}, -- great chakra potion

	[8472] = {empty = 7635, splash = 3, health = {200, 400}, mana = {110, 190}, level = 80, vocations = {3, 7}, vocStr = "paladins"} -- great spirit potion
}

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (1000))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local potion = POTIONS[item.itemid]
	if(not potion) then
		return false
	end

	if(not isPlayer(itemEx.uid) or (not config.usableOnTarget and cid ~= itemEx.uid)) then
		if(not config.splashable) then
			return false
		end

		if(toPosition.x == CONTAINER_POSITION) then
			toPosition = getThingPos(item.uid)
		end

		doDecayItem(doCreateItem(2016, potion.splash, toPosition))
		doRemoveItem(item.uid, 1)

		doPlayerAddItem(cid, potion.empty, 1)
		return true
	end

	if(hasCondition(cid, CONDITION_EXHAUST)) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return true
	end

	if(((potion.level and getPlayerLevel(cid) < potion.level) or (potion.vocations and not isInArray(potion.vocations, getPlayerVocation(cid)))) and
		not getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES))
	then
		doCreatureSay(itemEx.uid, "Only " .. potion.vocStr .. (potion.level and (" of level " .. potion.level) or "") .. " or above may drink this fluid.", TALKTYPE_MONSTER)
		return true
	end

	if(config.range > 0 and cid ~= itemEx.uid and getDistanceBetween(getCreaturePosition(cid), getCreaturePosition(itemEx.uid)) > config.range) then
		return false
	end

	local health = potion.health
	if(health and not doCreatureAddHealth(itemEx.uid, math.ceil(math.random(health[1], health[2]) * config.healthMultiplier))) then
		return false
	end

	local mana = potion.mana
	if(mana and not doPlayerAddMana(itemEx.uid, math.ceil(math.random(mana[1], mana[2]) * config.manaMultiplier))) then
		return false
	end

	doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE)
	if(not config.realAnimation) then
		doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_MONSTER)
	else
		for i, tid in ipairs(getSpectators(getCreaturePosition(cid), 1, 1)) do
			if(isPlayer(tid)) then
				doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_MONSTER, false, tid)
			end
		end
	end

	doAddCondition(cid, exhaust)
	doRemoveItem(item.uid, 1)
	if(not potion.empty or config.removeOnUse) then
		return true
	end

	doPlayerAddItem(cid, potion.empty, 1)
	return true
end