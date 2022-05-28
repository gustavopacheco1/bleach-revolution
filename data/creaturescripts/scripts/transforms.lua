local vocation_outfits = {
    ["Ichigo Kurosaki"] = {
        [1] = 1,
        [100] = 2
    },

    ["Chad"] = {
        [1] = 3,
        [100] = 4
    },

    ["Bazz-B"] = {
        [1] = 5,
        [100] = 6
    },

    ["Orihime Inoue"] = {
        [1] = 7,
        [100] = 8
    },

    ["Uryu Ishida"] = {
        [1] = 9,
        [100] = 10
    },

    ["Ulquiorra Ciffer"] = {
        [1] = 11,
        [100] = 12
    },

    ["Zaraki Kenpachi"] = {
        [1] = 13,
        [100] = 14
    },

    ["Byakuya Kuchiki"] = {
        [1] = 15,
        [100] = 16
    },

    ["Toshiro Hitsugaya"] = {
        [1] = 17,
        [100] = 18
    },

    ["Rukia Kuchiki"] = {
        [1] = 19,
        [100] = 20
    },

    ["Nelliel Odelschwanck"] = {
        [1] = 21,
        [100] = 22
    },

    ["Retsu Unohana"] = {
        [1] = 23,
        [100] = 24
    },

    ["Renjii Abarai"] = {
        [1] = 25,
        [100] = 26
    },

    ["Gin Ichimaru"] = {
        [1] = 27,
        [100] = 28
    },

    ["Kuugo Ginjou"] = {
        [1] = 29,
        [100] = 30
    },

    ["Tier Halibel"] = {
        [1] = 31,
        [100] = 32
    },

    ["Urahara Kisuke"] = {
        [1] = 33,
        [100] = 34
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

    if newLevel < 100 and canPlayerWearOutfitId(cid, vocation_outfits[player_vocation_name][100]) then
        doPlayerRemoveOutfitId(cid, vocation_outfits[player_vocation_name][100])
        return true
    end

    if newLevel >= 100 and not canPlayerWearOutfitId(cid, vocation_outfits[player_vocation_name][100]) then
        doPlayerAddOutfitId(cid, vocation_outfits[player_vocation_name][100], 0)
    end

    return true
end

function onLogin(cid)
    local player_vocation_name = getPlayerVocationName(cid)

    if not vocation_outfits[player_vocation_name] then
        return true
    end

    if not canPlayerWearOutfitId(cid, vocation_outfits[player_vocation_name][1]) then
        doPlayerAddOutfitId(cid, vocation_outfits[player_vocation_name][1], 0)
        doCreatureChangeOutfitId(cid, { lookType = vocation_outfits[player_vocation_name][1] })
    end

    local player_level = getPlayerLevel(cid)

    if player_level >= 100 and not canPlayerWearOutfitId(cid, vocation_outfits[player_vocation_name][100]) then
        doPlayerAddOutfitId(cid, vocation_outfits[player_vocation_name][1], 0)
        return true
    end

    if player_level < 100 and canPlayerWearOutfitId(cid, vocation_outfits[player_vocation_name][100]) then
        doPlayerRemoveOutfitId(cid, vocation_outfits[player_vocation_name][100])
    end

    return true
end
