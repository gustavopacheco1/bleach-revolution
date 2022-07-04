local spell = {
	cooldown = 50,
	duration = 3,
	effect = 20,
}

local function getClosestTarget(cid, current_target, previous_target)
	if current_target == nil then
		return previous_target
	end

	local best_target = current_target
	local cid_position = getCreaturePosition(cid)

	if getDistanceBetween(cid_position, getCreaturePosition(previous_target)) <
		getDistanceBetween(cid_position, getCreaturePosition(current_target)) then
		best_target = previous_target
	end

	return best_target
end

function onCastSpell(cid, var)
	if checkSpecialCooldown(cid) then
		return false
	end

	local param = var.string

	if not table.contains({ "all", "guild" }, param) then
		MultiLanguage.doPlayerSendCancel(
			cid,
			"Invalid parameter.",
			"Parâmetro inválido."
		)
		return false
	end

	local player_position = getCreaturePosition(cid)
	local target_corpse

	for _, spectator in ipairs(getSpectators(player_position, 7, 5)) do
		if spectator ~= cid and getCreatureStorage(spectator, "dead_player_id") ~= 0 and
			isSightClear(player_position, getCreaturePosition(spectator), false) then
			if param == "all" then
				target_corpse = getClosestTarget(cid, target_corpse, spectator)
			end

			if param == "guild" then
				if getPlayerGuildId(cid) == getPlayerGuildId(spectator) then
					target_corpse = getClosestTarget(cid, target_corpse, spectator)
				end
			end
		end
	end

	if not target_corpse then
		if param == "all" then
			MultiLanguage.doPlayerSendCancel(
				cid,
				"There are no dead players nearby.",
				"Não há jogadores mortos por perto."
			)
			return false
		end

		if param == "guild" then
			MultiLanguage.doPlayerSendCancel(
				cid,
				"There are no dead guild members nearby.",
				"Não há membros da sua guild mortos por perto."
			)
			return false
		end
	end

	local target = getCreatureStorage(target_corpse, "dead_player_id")
	local target_position = getCreaturePosition(target_corpse)

	doSendDistanceShoot(player_position, target_position, 20)
	doSendMagicEffect(target_position, 20)

	doRemoveCreature(target_corpse)
	doTeleportThing(target, target_position)
	if isPlayerGhost(target) then
		doCreatureExecuteTalkAction(target, "###invisible", true)
	end
	doPlayerSetGroupId(target, getPlayerStorageValue(target, "group"))

	-- TODO: Connect spell with creaturescript

	exhaustion.set(cid, "special", spell.cooldown)
	return true
end
