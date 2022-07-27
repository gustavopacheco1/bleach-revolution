function doCombatLoop(cid, combat, loop_amount, loop_ms_delay, effect)
	for i = 0, loop_amount - 1 do
		addEvent(function()
			if not isCreature(cid) then
				return
			end

			local target = getCreatureTarget(cid)

			if isCreature(target) then
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
				local player_position = getCreaturePosition(cid)

				if not isSightClear(player_position, target_position, false) then
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

function checkSpecialCooldown(cid)
	if exhaustion.check(cid, "special") then
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
	return false
end

--Waves
AREA_WAVE4 = {
	{ 1, 1, 1, 1, 1 },
	{ 0, 1, 1, 1, 0 },
	{ 0, 1, 1, 1, 0 },
	{ 0, 0, 3, 0, 0 }
}

AREA_SQUAREWAVE5 = {
	{ 1, 1, 1 },
	{ 1, 1, 1 },
	{ 1, 1, 1 },
	{ 0, 1, 0 },
	{ 0, 3, 0 }
}

AREA_WAVE5 = {
	{ 0, 1, 1, 1, 0 },
	{ 1, 1, 1, 1, 1 },
	{ 0, 1, 1, 1, 0 },
	{ 0, 0, 1, 0, 0 },
	{ 0, 0, 3, 0, 0 }
}

--Diagonal waves
AREADIAGONAL_WAVE4 = {
	{ 0, 0, 0, 0, 1, 0 },
	{ 0, 0, 0, 1, 1, 0 },
	{ 0, 0, 1, 1, 1, 0 },
	{ 0, 1, 1, 1, 1, 0 },
	{ 1, 1, 1, 1, 1, 0 },
	{ 0, 0, 0, 0, 0, 3 }
}

AREADIAGONAL_SQUAREWAVE5 = {
	{ 1, 1, 1, 0, 0 },
	{ 1, 1, 1, 0, 0 },
	{ 1, 1, 1, 0, 0 },
	{ 0, 0, 0, 1, 0 },
	{ 0, 0, 0, 0, 3 }
}

AREADIAGONAL_WAVE5 = {
	{ 0, 0, 0, 0, 1, 0 },
	{ 0, 1, 1, 1, 0, 0 },
	{ 0, 1, 1, 1, 0, 0 },
	{ 0, 1, 1, 1, 0, 0 },
	{ 1, 0, 0, 0, 1, 0 },
	{ 0, 0, 0, 0, 0, 3 }
}

--Beams
AREA_BEAM1 = {
	{ 3 }
}

AREA_BEAM5 = {
	{ 1 },
	{ 1 },
	{ 1 },
	{ 1 },
	{ 1 },
	{ 3 }
}

AREA_BEAM7 = {
	{ 1 },
	{ 1 },
	{ 1 },
	{ 1 },
	{ 1 },
	{ 1 },
	{ 1 },
	{ 3 }
}

--Diagonal Beams
AREADIAGONAL_BEAM5 = {
	{ 1, 0, 0, 0, 0, 0 },
	{ 0, 1, 0, 0, 0, 0 },
	{ 0, 0, 1, 0, 0, 0 },
	{ 0, 0, 0, 1, 0, 0 },
	{ 0, 0, 0, 0, 1, 0 },
	{ 0, 0, 0, 0, 0, 3 }
}

AREADIAGONAL_BEAM7 = {
	{ 1, 0, 0, 0, 0, 0, 0, 0 },
	{ 0, 1, 0, 0, 0, 0, 0, 0 },
	{ 0, 0, 1, 0, 0, 0, 0, 0 },
	{ 0, 0, 0, 1, 0, 0, 0, 0 },
	{ 0, 0, 0, 0, 1, 0, 0, 0 },
	{ 0, 0, 0, 0, 0, 1, 0, 0 },
	{ 0, 0, 0, 0, 0, 0, 1, 0 },
	{ 0, 0, 0, 0, 0, 0, 0, 3 }
}

--Circles
AREA_CIRCLE2X2 = {
	{ 0, 1, 1, 1, 0 },
	{ 1, 1, 1, 1, 1 },
	{ 1, 1, 3, 1, 1 },
	{ 1, 1, 1, 1, 1 },
	{ 0, 1, 1, 1, 0 }
}

AREA_CIRCLE3X3 = {
	{ 0, 0, 1, 1, 1, 0, 0 },
	{ 0, 1, 1, 1, 1, 1, 0 },
	{ 1, 1, 1, 1, 1, 1, 1 },
	{ 1, 1, 1, 3, 1, 1, 1 },
	{ 1, 1, 1, 1, 1, 1, 1 },
	{ 0, 1, 1, 1, 1, 1, 0 },
	{ 0, 0, 1, 1, 1, 0, 0 }
}

-- Crosses
AREA_CROSS1X1 = {
	{ 0, 1, 0 },
	{ 1, 3, 1 },
	{ 0, 1, 0 }
}

AREA_CROSS2X2 = {
	{ 1, 1, 1, 1, 1 },
	{ 1, 1, 1, 1, 1 },
	{ 1, 1, 3, 1, 1 },
	{ 1, 1, 1, 1, 1 },
	{ 1, 1, 1, 1, 1 }
}

AREA_CROSS3X3 = {
	{ 1, 1, 1, 1, 1, 1, 1 },
	{ 1, 1, 1, 1, 1, 1, 1 },
	{ 1, 1, 1, 1, 1, 1, 1 },
	{ 1, 1, 1, 3, 1, 1, 1 },
	{ 1, 1, 1, 1, 1, 1, 1 },
	{ 1, 1, 1, 1, 1, 1, 1 },
	{ 1, 1, 1, 1, 1, 1, 1 }
}

AREA_CROSS5X5 = {
	{ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 },
	{ 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0 },
	{ 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
	{ 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
	{ 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
	{ 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1 },
	{ 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
	{ 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
	{ 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
	{ 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0 },
	{ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 }
}

AREA_CROSS6X6 = {
	{ 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 },
	{ 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0 },
	{ 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
	{ 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0 },
	{ 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
	{ 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
	{ 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1 },
	{ 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
	{ 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
	{ 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0 },
	{ 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
	{ 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0 },
	{ 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 }
}

--Squares
AREA_SQUARE1X1 = {
	{ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 },
	{ 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0 },
	{ 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0 },
	{ 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0 },
	{ 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0 },
	{ 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1 },
	{ 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0 },
	{ 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0 },
	{ 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0 },
	{ 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0 },
	{ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 }
}

AREA_SQUARE1X7 = {
	{ 0, 0, 0 },
	{ 0, 0, 0 },
	{ 0, 0, 1 }
}


-- Walls
AREA_WALLFIELD = {
	{ 1, 1, 3, 1, 1 }
}

AREADIAGONAL_WALLFIELD = {
	{ 0, 0, 0, 0, 1 },
	{ 0, 0, 0, 1, 1 },
	{ 0, 1, 3, 1, 0 },
	{ 1, 1, 0, 0, 0 },
	{ 1, 0, 0, 0, 0 },
}
