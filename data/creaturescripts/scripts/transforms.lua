local vocation_outfits = {
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
	}
}

function onAdvance(cid, skill, oldLevel, newLevel)
	if skill ~= SKILL__LEVEL then
		return true
	end

	local player_vocation_name = getPlayerVocationName(cid)

	if not vocation_outfits[player_vocation_name] then
		return true
	end

	if newLevel < 100 and canPlayerWearOutfit(cid, vocation_outfits[player_vocation_name][100]) then
		doPlayerRemoveOutfit(cid, vocation_outfits[player_vocation_name][100])
		return true
	end

	if newLevel >= 100 and not canPlayerWearOutfit(cid, vocation_outfits[player_vocation_name][100]) then
		doPlayerAddOutfit(cid, vocation_outfits[player_vocation_name][100], 0)
	end

	return true
end

function onLogin(cid)
	local player_vocation_name = getPlayerVocationName(cid)

	if not vocation_outfits[player_vocation_name] then
		return true
	end

	if not canPlayerWearOutfit(cid, vocation_outfits[player_vocation_name][1]) then
		doPlayerAddOutfit(cid, vocation_outfits[player_vocation_name][1], 0)
		doCreatureChangeOutfit(cid, { lookType = vocation_outfits[player_vocation_name][1] })
	end

	local player_level = getPlayerLevel(cid)

	if player_level >= 100 and not canPlayerWearOutfit(cid, vocation_outfits[player_vocation_name][100]) then
		doPlayerAddOutfit(cid, vocation_outfits[player_vocation_name][1], 0)
		return true
	end

	if player_level < 100 and canPlayerWearOutfit(cid, vocation_outfits[player_vocation_name][100]) then
		doPlayerRemoveOutfit(cid, vocation_outfits[player_vocation_name][100])
	end

	return true
end
