local potions = {
	-- great reiatsu potion
	[16111] = { heal = {mana = 30000, randomizer = 2500}, effect = 502 },

	-- ultimate potion
	[16112] = { heal = {health = 15000, mana = 15000, randomizer = 2500}, effect = 502 },

	-- reiatsu potion
	[16113] = { heal = {mana = 15000, randomizer = 2500}, effect = 502 },

	-- health potion
	[16114] = { heal = {health = 15000, randomizer = 2500}, effect = 502 },

	-- reiatsu pill
	[16116] = { heal = {mana = 8000, randomizer = 2500}, effect = 502 },

	-- health pill
	[16117] = { heal = {health = 8000, randomizer = 2500}, effect = 502 },

	-- great health potion
	[16118] = { heal = {health = 30000, randomizer = 2500}, effect = 502 }
}

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, 900)

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isPlayer(itemEx.uid) and not hasCondition(cid, CONDITION_EXHAUST) then
		local potion = potions[item.itemid]

		if potion.heal.health then
			doCreatureAddHealth(itemEx.uid, math.random(potion.heal.health - potion.heal.randomizer, potion.heal.health + potion.heal.randomizer))
		end

		if potion.heal.mana then
			doCreatureAddMana(itemEx.uid, math.random(potion.heal.mana - potion.heal.randomizer, potion.heal.mana + potion.heal.randomizer))
		end

		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, potions[item.itemid].effect)
		doAddCondition(cid, exhaust)
		doCreatureSay(cid, "Aaaah...", TALKTYPE_MONSTER_SAY)
	end
	return true
end
