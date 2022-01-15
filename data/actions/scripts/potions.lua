local config = {

	-- [ID DO ITEM] = { health = Porcentagem de Vida, mana = Porcentagem de Mana},
	
	-- Pilula de mana
	[XXXX] = { health = 0, mana = 20 },
	-- Pilula de saude
	[YYYY] = { health = 20, mana = 0 },
	-- grande Pilula
	[ZZZZ] = { health = 20, mana = 35 },
}

function onUse(cid, item, from, itemEx, to)
	local pill = config[item.itemid]
	
	addHelth(cid, pill.health)
	addMana(cid, pill.mana)
	
return true
end

function addHelth(cid, percentageHealth)
	if (percentageHealth > 0) then
		local playerMaxHealth = getCreatureMaxHealth(cid)
		local healthAmount = calculatePercentageRestoration(playerMaxHealth, percentageHealth)
		doCreatureAddHealth(cid, healthAmount)
	end
end

function addMana(cid, percentageMana)
	if (percentageMana > 0) then
		local playerMaxMana = getCreatureMaxMana(cid)
		local manaAmount = calculatePercentageRestoration(playerMaxMana, percentageMana)
		doCreatureAddMana(cid, manaAmount)
	end
end

function calculatePercentageRestoration(value, percentage)
	return math.ceil(math.abs((value * (percentage / 100)+0.5)))
end