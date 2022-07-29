function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getCreatureStorage(cid, "tutorial") < 3 then
		return true
	end

	if getCreaturePosition(cid).y > toPosition.y then
		doTeleportThing(cid, { x = toPosition.x, y = toPosition.y - 1, z = toPosition.z })
	else
		doTeleportThing(cid, { x = toPosition.x, y = toPosition.y + 1, z = toPosition.z })
	end
	return true
end
