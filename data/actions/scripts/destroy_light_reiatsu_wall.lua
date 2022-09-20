function onUse(cid, item, fromPosition, itemEx, toPosition)
	doRemoveItem(item.uid)
	doSendMagicEffect(toPosition, 571)
	return true
end
