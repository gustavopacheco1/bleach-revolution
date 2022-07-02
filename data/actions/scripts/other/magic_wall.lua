local wall_id = 16138
local wall_time_in_seconds = 15
local distance_shoot_missile_id = 86

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if exhaustion.check(cid, "magic_wall") then
		return false
	end

	if getTileInfo(toPosition).protection or getTileInfo(getCreaturePosition(cid)).protection then
		return false
	end

	doCreateItem(wall_id, toPosition)
	doSendDistanceShoot(fromPosition, toPosition, distance_shoot_missile_id)
	doRemoveItem(item.uid, 1)
	addEvent(
		function()
			if getTileItemById(toPosition, wall_id).uid > 0 then
				doRemoveItem(getTileItemById(toPosition, wall_id).uid)
			end
		end,
		wall_time_in_seconds * 1000
	)

	doSendAnimatedText(toPosition, wall_time_in_seconds, COLOR_YELLOW)
	for i = 1, wall_time_in_seconds do
		addEvent(
			function()
				if wall_time_in_seconds - i == 0 or not (getTileItemById(toPosition, wall_id).uid > 0) then
					return
				end

				doSendAnimatedText(toPosition, wall_time_in_seconds - i, COLOR_YELLOW)
			end,
			i * 1000
		)
	end

	exhaustion.set(cid, "magic_wall", 1)
	return true
end
