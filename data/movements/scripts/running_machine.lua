local walkback = {
	[8000] = SOUTH,
	[8001] = EAST,
}

local runnning_machines_itemid = { 16453, 16454 }

function onStepIn(cid, item, position, fromPosition)
	if table.contains(runnning_machines_itemid, item.itemid) then
		if hasCondition(cid, CONDITION_HASTE) then
			doPlayerDispelCondition(cid, CONDITION_HASTE)
		end

		doChangeSpeed(cid, -getCreatureSpeed(cid) + 100)
		return true
	end

	local running_machine_dir = walkback[getItemAttribute(item.uid, "aid")]

	doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
	doTeleportThing(cid, getPositionByDirection(getCreaturePosition(cid), running_machine_dir), false)
	return true
end

function onStepOut(cid, item, position, fromPosition)
	doChangeSpeed(cid, -getCreatureSpeed(cid) + getCreatureBaseSpeed(cid))
	return true
end
