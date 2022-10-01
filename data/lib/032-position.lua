function isInRange(position, fromPosition, toPosition)
	return (position.x >= fromPosition.x and position.y >= fromPosition.y and position.z >= fromPosition.z
		and position.x <= toPosition.x and position.y <= toPosition.y and position.z <= toPosition.z)
end

function getDistanceBetween(fromPosition, toPosition)
	local x, y = math.abs(fromPosition.x - toPosition.x), math.abs(fromPosition.y - toPosition.y)
	local diff = math.max(x, y)
	if (fromPosition.z ~= toPosition.z) then
		diff = diff + 9 + 6
	end

	return diff
end

function getDirectionTo(pos1, pos2)
	local dir = SOUTH
	if (pos1.x > pos2.x) then
		dir = WEST
		if (pos1.y > pos2.y) then
			dir = NORTHWEST
		elseif (pos1.y < pos2.y) then
			dir = SOUTHWEST
		end
	elseif (pos1.x < pos2.x) then
		dir = EAST
		if (pos1.y > pos2.y) then
			dir = NORTHEAST
		elseif (pos1.y < pos2.y) then
			dir = SOUTHEAST
		end
	elseif (pos1.y > pos2.y) then
		dir = NORTH
	elseif (pos1.y < pos2.y) then
		dir = SOUTH
	end

	return dir
end

function getCreatureLookPosition(cid)
	return getPositionByDirection(getThingPosition(cid), getCreatureLookDirection(cid))
end

function getPositionByDirection(position, direction, size)
	local n = size or 1
	if (direction == NORTH) then
		position.y = position.y - n
	elseif (direction == SOUTH) then
		position.y = position.y + n
	elseif (direction == WEST) then
		position.x = position.x - n
	elseif (direction == EAST) then
		position.x = position.x + n
	elseif (direction == NORTHWEST) then
		position.y = position.y - n
		position.x = position.x - n
	elseif (direction == NORTHEAST) then
		position.y = position.y - n
		position.x = position.x + n
	elseif (direction == SOUTHWEST) then
		position.y = position.y + n
		position.x = position.x - n
	elseif (direction == SOUTHEAST) then
		position.y = position.y + n
		position.x = position.x + n
	end

	return position
end

function doComparePositions(position, positionEx)
	return position.x == positionEx.x and position.y == positionEx.y and position.z == positionEx.z
end

function getArea(position, x, y)
	local t = {}
	for i = (position.x - x), (position.x + x) do
		for j = (position.y - y), (position.y + y) do
			table.insert(t, { x = i, y = j, z = position.z })
		end
	end

	return t
end

function isWalkable(pos, creature, proj)
	if getTileThingByPos({ x = pos.x, y = pos.y, z = pos.z, stackpos = 0 }).itemid == 0 then return false end
	if getTopCreature(pos).uid > 0 and creature then return false end
	local n = not proj and 3 or 2
	for i = 0, 255 do
		pos.stackpos = i
		local tile = getTileThingByPos(pos)
		if tile.itemid ~= 0 and not isCreature(tile.uid) then
			if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
				return false
			end
		end
	end
	return true
end

function Position(x, y, z, stackpos)
	local position = { x = 0, y = 0, z = 0 }
	if (isNumeric(x .. y .. z)) then
		position = { x = x, y = y, z = z }
		if (isNumeric(stackpos)) then
			position.stackpos = stackpos
		end
	end

	return position
end

function isValidPosition(position)
	return (isNumeric(position.x .. position.y .. position.z) and position.x > 0
		and position.y > 0 and position.z >= 0 and position.z <= 15)
end

function getPlayersInRange(fromPosition, toPosition)
	local players = {}

	for x = fromPosition.x, toPosition.x do
		for y = fromPosition.y, toPosition.y do
			for z = fromPosition.z, toPosition.z do
				local player = getTopCreature({ x = x, y = y, z = z, stackpos = 253 }).uid

				if isPlayer(player) then
					table.insert(players, player)
				end
			end
		end
	end

	return players
end

function getCreaturesInRange(fromPosition, toPosition, name)
	local creatures = {}

	for x = fromPosition.x, toPosition.x do
		for y = fromPosition.y, toPosition.y do
			for z = fromPosition.z, toPosition.z do
				local creature = getTopCreature({ x = x, y = y, z = z, stackpos = 253 }).uid

				if isCreature(creature) then
					if name and getCreatureName(creature) == name or not name then
						table.insert(creatures, creature)
					end
				end
			end
		end
	end

	return creatures
end

function doRemoveCreaturesInRange(fromPosition, toPosition, name)
	for _, creature in ipairs(getCreaturesInRange(fromPosition, toPosition, name)) do
		doRemoveCreature(creature)
	end
end

function doCreateMonstersInRange(name, amount, fromPosition, toPosition)
	local monsters = {}

	while #monsters < amount do
		local position = {
			x = math.random(fromPosition.x, toPosition.x),
			y = math.random(fromPosition.y, toPosition.y),
			z = fromPosition.z,
		}

		if isWalkable(position, true, true) then
			local monster = doCreateMonster(name, position, false, true)
			table.insert(monsters, monster)
		end
	end

	return monsters
end
