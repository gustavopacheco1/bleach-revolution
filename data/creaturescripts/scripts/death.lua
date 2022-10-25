local function getDeathSoulClone(cid)
	for _, summon in ipairs(getCreatureSummons(cid)) do
		if getCreatureName(summon) == "Soul" then
			return summon
		end
	end

	return false
end

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

	doRemoveCreatureSummons(cid)

	doCreatureSetNoMove(cid, true)
	setCreatureTarget(cid, nil)
	doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
	doPlayerSetGroupId(cid, 7)
	if not isPlayerGhost(cid) then
		doCreatureExecuteTalkAction(cid, "###invisible", true)
	end

	doSummonMonster(cid, "Death Clone")
	local clone = getDeathSoulClone(cid)

	doCreatureSetLookDirection(clone, NORTH)
	addEvent(doCreatureSetStorage, 1000, clone, "dead_player_id", cid)
	doSetCreatureOutfit(cid, { lookType = 0 }, 6000)
	doCreatureSetHideHealth(clone, true)

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
			doCreatureSetNoMove(cid, false)
		end

	end, 6000)

	return false
end
