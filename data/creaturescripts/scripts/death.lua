function onStatsChange(cid, attacker, type, combat, value)
	if not
		(
		value >= 1 and
			(type == STATSCHANGE_HEALTHLOSS or (type == STATSCHANGE_MANALOSS and getCreatureCondition(cid, CONDITION_MANASHIELD))
			)) then
		return true
	end

	if value < getCreatureHealth(cid) then
		return true
	end

	if getPlayerGroupId(cid) == 8 then
		return true
	end

	local death_position = getCreaturePosition(cid)

	local clone = doCreateMonster("Rukia Clone", getCreaturePosition(cid), false, true)
	doCreatureChangeOutfit(clone, getCreatureOutfit(cid))
	doCreatureSetHideHealth(clone, true)
	addEvent(function()
		doCreatureSetStorage(clone, "dead_player_id", cid)
	end, 1000)

	setCreatureTarget(cid, nil)
	doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
	doPlayerSetGroupId(cid, 8)
	if not isPlayerGhost(cid) then
		doCreatureSay(cid, "invisible")
	end

	addEvent(function()
		if isCreature(clone) then
			if isPlayer(cid) then
				if getPlayerGroupId(cid) == 8 then
					doTeleportThing(cid, death_position)
					doCreatureAddHealth(cid, -getCreatureMaxHealth(cid))
				end
			end

			doRemoveCreature(clone)
		end
	end, 6000)

	return false
end
