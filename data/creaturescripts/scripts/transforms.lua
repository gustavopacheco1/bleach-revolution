function onAdvance(cid, skill, oldLevel, newLevel)
	if skill ~= SKILL__LEVEL then
		return true
	end

	local player_outfits = VOCATION_OUTFITS[getPlayerVocationName(cid)]

	if not player_outfits then
		if getPlayerVocation(cid) ~= 0 then
			error('Outfit not found. (' .. getPlayerVocationName(cid) .. ')')
		end
		return true
	end

	for player_outfit_level, player_outfit_id in pairs(player_outfits) do
		if newLevel < player_outfit_level and canPlayerWearOutfit(cid, player_outfit_id) then
			doPlayerRemoveOutfit(cid, player_outfit_id)
			return true
		end

		if newLevel >= player_outfit_level and not canPlayerWearOutfit(cid, player_outfit_id) then
			doPlayerAddOutfit(cid, player_outfit_id, 0)
		end
	end

	return true
end

function onLogin(cid)
	local player_vocation_name = getPlayerVocationName(cid)
	local player_outfits = VOCATION_OUTFITS[player_vocation_name]

	if not player_outfits then
		if getPlayerVocation(cid) ~= 0 then
			error('Outfit not found. (' .. player_vocation_name .. ')')
		end
		return true
	end

	for vocation_name, _ in pairs(VOCATION_OUTFITS) do
		for _, vocation_outfit_id in pairs(VOCATION_OUTFITS[vocation_name]) do
			if canPlayerWearOutfit(cid, vocation_outfit_id) and vocation_name ~= player_vocation_name then
				doPlayerRemoveOutfit(cid, vocation_outfit_id)
			end
		end
	end

	local player_level = getPlayerLevel(cid)

	for player_outfit_level, player_outfit_id in pairs(player_outfits) do
		if player_level < player_outfit_level and canPlayerWearOutfit(cid, player_outfit_id) then
			doPlayerRemoveOutfit(cid, player_outfit_id)
			return true
		end

		if player_level >= player_outfit_level and not canPlayerWearOutfit(cid, player_outfit_id) then
			doPlayerAddOutfit(cid, player_outfit_id, 0)
		end
	end

	return true
end
