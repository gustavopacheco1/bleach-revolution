local SPOTS = { 384, 418, 8278, 8592 }

function onCastSpell(cid, var)
	local position = getCreaturePosition(cid)
	position.stackpos = 0

	if not isInArray(SPOTS, getThingFromPos(position).itemid) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		doSendMagicEffect(position, CONST_ME_POFF)
		return false
	end

	local newPosition = position
	newPosition.y = newPosition.y + 1
	newPosition.z = newPosition.z - 1

	doTeleportThing(cid, newPosition, false)
	doSendMagicEffect(position, CONST_ME_TELEPORT)
	return true
end
