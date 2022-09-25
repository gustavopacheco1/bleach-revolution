-- Formulas
function getAreaFormula(cid, level, maglevel)
	local min = ((maglevel * 16 * 2) + (level * 3 * 3)) * 2.5
	local max = ((maglevel * 16 * 3) + (level * 4 * 3.4)) * 2.5
	return -min, -max
end

function getSingleShootFormula(cid, level, maglevel)
	local min = ((maglevel * 16 * 2) + (level * 3 * 3)) * 3
	local max = ((maglevel * 16 * 3) + (level * 4 * 3.4)) * 3
	return -min, -max
end

function getFiveShootsFormula(cid, level, maglevel)
	local min = (maglevel * 16 * 2) + (level * 3 * 3)
	local max = (maglevel * 16 * 3) + (level * 4 * 3.4)
	return -min, -max
end

function getCannonFormula(cid, level, maglevel)
	local min = ((maglevel * 16 * 2) + (level * 3 * 3)) * 7
	local max = ((maglevel * 16 * 3) + (level * 4 * 3.4)) * 7
	return -min, -max
end

-- Waves
AREA_BIG_CANNON_6SQM = {
	{ 1, 1, 1 },
	{ 1, 1, 1 },
	{ 1, 1, 1 },
	{ 1, 1, 1 },
	{ 1, 1, 1 },
	{ 1, 3, 1 }
}

AREADIAGONAL_BIG_CANNON_6SQM = {
	{ 1, 1, 0, 0, 0, 0 },
	{ 1, 1, 1, 0, 0, 0 },
	{ 0, 1, 1, 1, 0, 0 },
	{ 0, 0, 1, 1, 1, 0 },
	{ 0, 0, 0, 1, 1, 1 },
	{ 0, 0, 0, 0, 1, 3 }
}

AREA_CANNON_6SQM = {
	{ 1,},
	{ 1,},
	{ 1,},
	{ 1,},
	{ 1,},
	{ 3,}
}

AREADIAGONAL_CANNON_6SQM = {
	{ 1, 0, 0, 0, 0, 0 },
	{ 0, 1, 0, 0, 0, 0 },
	{ 0, 0, 1, 0, 0, 0 },
	{ 0, 0, 0, 1, 0, 0 },
	{ 0, 0, 0, 0, 1, 0 },
	{ 0, 0, 0, 0, 0, 3 }
}

-- Circles
AREA_CIRCLE3X3_FULL = {
	{ 0, 0, 1, 1, 1, 0, 0 },
	{ 0, 1, 1, 1, 1, 1, 0 },
	{ 1, 1, 1, 1, 1, 1, 1 },
	{ 1, 1, 1, 2, 1, 1, 1 },
	{ 1, 1, 1, 1, 1, 1, 1 },
	{ 0, 1, 1, 1, 1, 1, 0 },
	{ 0, 0, 1, 1, 1, 0, 0 }
}

AREA_CIRCLE3X3_FIRST = {
	{ 1, 1, 1 },
	{ 1, 2, 1 },
	{ 1, 1, 1 },
}

AREA_CIRCLE3X3_SECOND = {
	{ 0, 1, 1, 1, 0 },
	{ 1, 0, 0, 0, 1 },
	{ 1, 0, 2, 0, 1 },
	{ 1, 0, 0, 0, 1 },
	{ 0, 1, 1, 1, 0 },
}

AREA_CIRCLE3X3_THIRD = {
	{ 0, 0, 1, 1, 1, 0, 0 },
	{ 0, 1, 0, 0, 0, 1, 0 },
	{ 1, 0, 0, 0, 0, 0, 1 },
	{ 1, 0, 0, 2, 0, 0, 1 },
	{ 1, 0, 0, 0, 0, 0, 1 },
	{ 0, 1, 0, 0, 0, 1, 0 },
	{ 0, 0, 1, 1, 1, 0, 0 }
}

AREA_CIRCLE3X3_FIRST_CENTER_X = {
	{ 1, 1, 1 },
	{ 1, 0, 3 },
	{ 1, 1, 1 },
}

AREA_CIRCLE3X3_SECOND_CENTER_X = {
	{ 0, 1, 1, 1, 0 },
	{ 1, 0, 0, 0, 1 },
	{ 1, 0, 0, 2, 1 },
	{ 1, 0, 0, 0, 1 },
	{ 0, 1, 1, 1, 0 },
}

AREA_CIRCLE3X3_THIRD_CENTER_X = {
	{ 0, 0, 1, 1, 1, 0, 0 },
	{ 0, 1, 0, 0, 0, 1, 0 },
	{ 1, 0, 0, 0, 0, 0, 1 },
	{ 1, 0, 0, 0, 2, 0, 1 },
	{ 1, 0, 0, 0, 0, 0, 1 },
	{ 0, 1, 0, 0, 0, 1, 0 },
	{ 0, 0, 1, 1, 1, 0, 0 }
}

AREA_CIRCLE3X3_FIRST_CENTER_XY = {
	{ 1, 1, 1 },
	{ 1, 0, 1 },
	{ 1, 1, 3 },
}

AREA_CIRCLE3X3_SECOND_CENTER_XY = {
	{ 0, 1, 1, 1, 0 },
	{ 1, 0, 0, 0, 1 },
	{ 1, 0, 0, 0, 1 },
	{ 1, 0, 0, 2, 1 },
	{ 0, 1, 1, 1, 0 },
}

AREA_CIRCLE3X3_THIRD_CENTER_XY = {
	{ 0, 0, 1, 1, 1, 0, 0 },
	{ 0, 1, 0, 0, 0, 1, 0 },
	{ 1, 0, 0, 0, 0, 0, 1 },
	{ 1, 0, 0, 0, 0, 0, 1 },
	{ 1, 0, 0, 0, 2, 0, 1 },
	{ 0, 1, 0, 0, 0, 1, 0 },
	{ 0, 0, 1, 1, 1, 0, 0 }
}

-- Functions
function doCombatLoop(cid, combat, loop_amount, loop_ms_delay, effect)
	for i = 0, loop_amount - 1 do
		addEvent(function()
			if not isCreature(cid) then
				return
			end

			local target = getCreatureTarget(cid)

			if not isCreature(target) then
				return
			end

			local target_position = getCreaturePosition(target)

			if not isSightClear(getCreaturePosition(cid), target_position, false) then
				return
			end

			if effect then
				doSendMagicEffect({
					x = target_position.x + effect.x,
					y = target_position.y + effect.y,
					z = target_position.z
				}, effect.id)
			end

			doCombat(cid, combat, numberToVariant(target))
		end, i * loop_ms_delay)
	end
end

CustomSpell = {
	randomShoot = function(cid, combat, loop_amount, loop_ms_delay, missile, effect)
		for i = 0, loop_amount - 1 do
			addEvent(function()
				if not isCreature(cid) then
					return
				end

				local target = getCreatureTarget(cid)

				if not isCreature(target) then
					return
				end

				local target_position = getCreaturePosition(target)
				local player_position = getCreaturePosition(cid)

				if not isSightClear(player_position, target_position, false) then
					return
				end

				for i = 1, 3 do
					doSendDistanceShoot({
						x = player_position.x + math.random(-1, 1),
						y = player_position.y + math.random(-1, 1),
						z = player_position.z
					}, target_position, missile)
				end

				doSendMagicEffect({
					x = target_position.x + effect.x,
					y = target_position.y + effect.y,
					z = target_position.z
				}, effect.id)

				doCombat(cid, combat, numberToVariant(target))
			end, i * loop_ms_delay)
		end
	end,

	randomEffect = function(cid, combat, loop_amount, loop_ms_delay, missile, effect)
		for i = 0, loop_amount - 1 do
			addEvent(function()
				if not isCreature(cid) then
					return
				end

				local target = getCreatureTarget(cid)

				if not isCreature(target) then
					return
				end

				local target_position = getCreaturePosition(target)
				local player_position = getCreaturePosition(cid)

				if not isSightClear(player_position, target_position, false) then
					return
				end

				for i = 1, 3 do
					doSendMagicEffect({
						x = target_position.x + effect.x + math.random(-1, 1),
						y = target_position.y + effect.y + math.random(-1, 1),
						z = target_position.z
					}, effect.id)
				end

				doSendDistanceShoot({
					x = player_position.x,
					y = player_position.y,
					z = player_position.z
				}, target_position, missile)

				doCombat(cid, combat, numberToVariant(target))
			end, i * loop_ms_delay)
		end
	end,

	randomShootEffect = function(cid, combat, loop_amount, loop_ms_delay, missile, effect)
		for i = 0, loop_amount - 1 do
			addEvent(function()
				if not isCreature(cid) then
					return
				end

				local target = getCreatureTarget(cid)

				if not isCreature(target) then
					return
				end

				local target_position = getCreaturePosition(target)
				local player_position = getCreaturePosition(cid)

				if not isSightClear(player_position, target_position, false) then
					return
				end

				for i = 1, 3 do
					doSendMagicEffect({
						x = target_position.x + effect.x + math.random(-1, 1),
						y = target_position.y + effect.y + math.random(-1, 1),
						z = target_position.z
					}, effect.id)

					doSendDistanceShoot({
						x = player_position.x + math.random(-1, 1),
						y = player_position.y + math.random(-1, 1),
						z = player_position.z
					}, target_position, missile)
				end

				doCombat(cid, combat, numberToVariant(target))
			end, i * loop_ms_delay)
		end
	end,

	skyShoot = function(cid, combat, loop_amount, loop_ms_delay, missile, effect)
		for loop = 0, loop_amount - 1 do
			addEvent(function()
				if not isCreature(cid) then
					return
				end

				local target = getCreatureTarget(cid)

				if not isCreature(target) then
					return
				end

				local target_position = getCreaturePosition(target)

				if not isSightClear(getCreaturePosition(cid), target_position, false) then
					return
				end


				for i = 1, 3 do
					local rand = { x = math.random(-1, 1), y = math.random(-1, 1) }

					doSendDistanceShoot({
						x = target_position.x - 5 + rand.x,
						y = target_position.y - 5 + rand.y,
						z = target_position.z
					}, {
						x = target_position.x + rand.x,
						y = target_position.y + rand.y,
						z = target_position.z
					}, missile)

					doSendMagicEffect({
						x = target_position.x + effect.x + rand.x,
						y = target_position.y + effect.y + rand.y,
						z = target_position.z
					}, effect.id)
				end


				doCombat(cid, combat, numberToVariant(target))
			end, loop * loop_ms_delay)
		end
	end,
}

function doCannon(cid, combat, var, cannon, effect)
	doCombat(cid, combat, var)

	local player_position = getPlayerPosition(cid)
	local look_direction = getCreatureLookDirection(cid)
	local effect_adjust = math.floor(cannon.height / 2)

	if look_direction == EAST then
		doSendMagicEffect({
			x = player_position.x + cannon.length,
			y = player_position.y + effect_adjust,
			z = player_position.z
		}, effect.east)
		return
	end

	if look_direction == WEST then
		doSendMagicEffect({
			x = player_position.x - 1,
			y = player_position.y + effect_adjust,
			z = player_position.z
		}, effect.west)
		return
	end

	if look_direction == NORTH then
		doSendMagicEffect({
			x = player_position.x + effect_adjust,
			y = player_position.y - 1,
			z = player_position.z
		}, effect.north)
		return
	end

	if look_direction == SOUTH then
		doSendMagicEffect({
			x = player_position.x + effect_adjust,
			y = player_position.y + cannon.length,
			z = player_position.z
		}, effect.south)
	end
end

function isInSpecialCooldown(cid)
	if not exhaustion.check(cid, "special") then
		return false
	end

	local exhaust = exhaustion.get(cid, "special")

	if not tonumber(exhaust) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return true
	end

	local plural = ""
	if exhaust ~= 1 then
		plural = "s"
	end
	MultiLanguage.doPlayerSendCancel(
		cid,
		"Cooldown: " .. exhaust .. " second" .. plural,
		"Cooldown: " .. exhaust .. " segundo" .. plural
	)
	return true
end
