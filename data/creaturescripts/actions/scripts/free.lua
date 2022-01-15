local config =	{
	itemId = 2197, -- item id
	itemCount = 1, -- count do item
	storage = 9844, -- storage
	days = 7 -- 7 dias para utilizar novamente a avalanca
}

function onUse(cid, item, frompos, item2, topos)
	if getPlayerStorageValue(cid, config.storage) >= os.time() then
		doPlayerSendTextMessage(cid,25, string.format('You can get your item only after %d day%s', config.days, config.days ~= 1 and "s" or "")))
		return true
	end

	doPlayerSendTextMessage(cid, 25, string.format('Congratulations! You get your free week, you can get your item after %d day%s', config.days, config.days ~= 1 and "s" or "")))
	setPlayerStorageValue(cid, config.storage, os.time() + config.days * 86400)
	doPlayerAddItem(cid, config.itemId, config.itemCount)
	doSendMagicEffect(getCreaturePosition(cid), 2)
	return true
end