-- NOTE: wall duration is set on item decay
local wall_id = 16138
local distance_shoot_missile_id = 86

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if exhaustion.check(cid, "reiatsu_wall") then
		return false
	end

	if not isPathable(cid, toPosition, false) then
		return doPlayerSendDefaultCancel(cid, RETURNVALUE_CANNOTUSETHISOBJECT)
	end

	local player_position = getCreaturePosition(cid)
	if getTileInfo(toPosition).protection or getTileInfo(player_position).protection then
		return false
	end

	doRemoveItem(item.uid, 1)
	doSendDistanceShoot(player_position, toPosition, distance_shoot_missile_id)
	local wall = doCreateItem(wall_id, toPosition)
	doDecayItem(wall)

	exhaustion.set(cid, "reiatsu_wall", 1)
	return true
end
