local vocations_outfits = {
	["Ichigo Kurosaki"] = {
		[1] = 3,
		[100] = 4
	},

	["Chad"] = {
		[1] = 409,
		[100] = 410
	},

	["Bazz-B"] = {
		[1] = 149,
		[100] = 148
	},

	["Orihime Inoue"] = {
		[1] = 382,
		[100] = 385
	},

	["Uryu Ishida"] = {
		[1] = 412,
		[100] = 413
	},

	["Ulquiorra Ciffer"] = {
		[1] = 400,
		[100] = 403
	},

	["Zaraki Kenpachi"] = {
		[1] = 415,
		[100] = 416
	},

	["Byakuya Kuchiki"] = {
		[1] = 418,
		[100] = 420
	},

	["Toshiro Hitsugaya"] = {
		[1] = 73,
		[100] = 78
	},

	["Rukia Kuchiki"] = {
		[1] = 370,
		[100] = 371
	},

	["Nelliel Odelschwanck"] = {
		[1] = 429,
		[100] = 430
	},

	["Retsu Unohana"] = {
		[1] = 425,
		[100] = 426
	},

	["Renjii Abarai"] = {
		[1] = 376,
		[100] = 378
	},

	["Gin Ichimaru"] = {
		[1] = 316,
		[100] = 320
	},

	["Kuugo Ginjou"] = {
		[1] = 326,
		[100] = 328
	},

	["Tier Halibel"] = {
		[1] = 321,
		[100] = 324
	},

	["Urahara Kisuke"] = {
		[1] = 331,
		[100] = 333
	},

	["Grimmjow Jaegerjaquez"] = {
		[1] = 406,
		[100] = 407
	},

	["Ikkaku Madarame"] = {
		[1] = 434,
		[100] = 437
	},

	["Coyote Starrk"] = {
		[1] = 448,
		[100] = 449
	},

	["Nnoitra Gilga"] = {
		[1] = 452,
		[100] = 453
	}
}

function onAdvance(cid, skill, oldLevel, newLevel)
	if skill ~= SKILL__LEVEL then
		return true
	end

	local player_outfits = vocations_outfits[getPlayerVocationName(cid)]

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
	local player_outfits = vocations_outfits[player_vocation_name]

	if not player_outfits then
		if getPlayerVocation(cid) ~= 0 then
			error('Outfit not found. (' .. player_vocation_name .. ')')
		end
		return true
	end

	for vocation_name, _ in pairs(vocations_outfits) do
		for _, vocation_outfit_id in pairs(vocations_outfits[vocation_name]) do
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
