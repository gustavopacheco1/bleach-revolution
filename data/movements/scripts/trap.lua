function onStepIn(cid, item, pos)
	if (isPlayer(cid) and not isPlayerGhost(cid)) then
		doCreatureAddHealth(cid, math.random(-7000, -6000), nil, COLOR_RED)
		doTransformItem(item.uid, item.itemid + 1)
	end
	return true
end

function onStepOut(cid, item, pos)
	doTransformItem(item.uid, item.itemid - 1)
	return true
end

function onRemoveItem(item, tile, pos)
	local thingPos = getThingPos(item.uid)
	if (getDistanceBetween(thingPos, pos) > 0) then
		doTransformItem(item.uid, item.itemid - 1)
		doSendMagicEffect(thingPos, CONST_ME_POFF)
	end
	return true
end
