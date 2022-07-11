function onStatsChange(cid, attacker, type, combat, value)
	if not (value >= 1 and (type == STATSCHANGE_HEALTHLOSS or (type == STATSCHANGE_MANALOSS and getCreatureCondition(cid, CONDITION_MANASHIELD)))) then
		return true
	end

	if value < getCreatureHealth(cid) then
		return true
	end

	if getPlayerGroupId(cid) == 7 then
		return true
	end

	local death_position = getCreaturePosition(cid)

	local clone = doCreateMonster("Rukia Clone", getCreaturePosition(cid), false, true)
	doCreatureChangeOutfit(clone, getCreatureOutfit(cid))
	doCreatureSetHideHealth(clone, true)
	addEvent(doCreatureSetStorage, 1000, clone, "dead_player_id", cid)

	setCreatureTarget(cid, nil)
	doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
	doPlayerSetGroupId(cid, 7)
	if not isPlayerGhost(cid) then
		doCreatureExecuteTalkAction(cid, "###invisible", true)
	end

	addEvent(function()
		if not isCreature(clone) then
			return
		end

		doRemoveCreature(clone)

		if not isCreature(cid) then
			return
		end

		if getPlayerGroupId(cid) == 7 then
			doTeleportThing(cid, death_position)
			doCreatureAddHealth(cid, -getCreatureMaxHealth(cid))
		end

	end, 6000)

	return false
end
