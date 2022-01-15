local items = {2647, 2650, 2661, 2668, 2393}
local chance = 10
local config =	{
	storage = 9844, -- storage
	days = 7 -- 7 dias para utilizar novamente o comando
}


function onSay(cid, words, param, channel)
	if getPlayerStorageValue(cid, storage) < 1 then
	doPlayerSendCancel(cid, "Apenas tutores, podem utilizar esse comando.")
	return false
	end

	if getPlayerStorageValue(cid, config.storage) >= os.time() then
		doPlayerSendTextMessage(cid,25, string.format('Voce pode obter outro KIT-Tutor apos %d day%s', config.days, config.days ~= 1 and "s" or ""))
		return true
	end

	doPlayerSendTextMessage(cid, 25, string.format('Parabens! Voce pego seu KIT-Tutor da semana , voce pode obter outro apos %d day%s', config.days, config.days ~= 1 and "s" or ""))
	setPlayerStorageValue(cid, config.storage, os.time() + config.days * 86400)

	if math.random(1, 100) <= chance then
	doPlayerSendCancel(cid, "Voce nao obteve nenhum item. Espere ate a proxima semana.")
	doRemoveItem(item.uid, 1)
	return true
	end
	doPlayerAddItem(cid, items[math.random(1, #items)], 1)
	doRemoveItem(item.cid, 1)
	doSendMagicEffect(getCreaturePosition(cid), 28)
	return true
end
