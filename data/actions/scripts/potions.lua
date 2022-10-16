local potions = {
	-- ultimate potion
	[16112] = { level = 180, heal = { health = 14000, mana = 14000, randomizer = 1300 }, effect = 502 },

	-- reiatsu potion
	[16113] = { level = 80, heal = { mana = 14000, randomizer = 1300 }, effect = 502 },

	-- health potion
	[16114] = { level = 80, heal = { health = 14000, randomizer = 1300 }, effect = 502 },

	-- reiatsu pill
	[16116] = { level = 1, heal = { mana = 1800, randomizer = 400 }, effect = 502 },

	-- health pill
	[16117] = { level = 1, heal = { health = 1800, randomizer = 400 }, effect = 502 },

	-- great health potion
	[16118] = { level = 200, heal = { health = 22000, randomizer = 2500 }, effect = 502 },

	-- great reiatsu potion
	[16111] = { level = 200, heal = { mana = 22000, randomizer = 2500 }, effect = 502 },
}

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, 900)

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isPlayer(itemEx.uid) and not hasCondition(cid, CONDITION_EXHAUST) then
		local potion = potions[item.itemid]

		if getPlayerLevel(cid) < potion.level then
			return MultiLanguage.doPlayerSendCancel(
				cid,
				"You need to be level " .. potion.level .. " to use this potion.",
				"Você precisa ser nível " .. potion.level .. " para utilizar esta poção."
			)
		end

		if potion.heal.health then
			doCreatureAddHealth(itemEx.uid, math.random(potion.heal.health - potion.heal.randomizer, potion.heal.health + potion.heal.randomizer))
		end

		if potion.heal.mana then
			doCreatureAddMana(itemEx.uid, math.random(potion.heal.mana - potion.heal.randomizer, potion.heal.mana + potion.heal.randomizer))
		end

		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, potions[item.itemid].effect)
		doAddCondition(cid, exhaust)
		doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_MONSTER_SAY)
	end
	return true
end
