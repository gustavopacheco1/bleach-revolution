local VOCATION_REVERT_DEATH = {
    -- Ichigo Kurosaki
    ["Ichigo Kurosaki"] = {
        [1] = 2,
        [100] = 3,
    },

    -- Chad
    ["Chad"] = {
        [1] = 157,
        [100] = 158,
	},

    -- Bazz-B
    ["Bazz-B"] = {
        [1] = 148,
        [100] = 149,
    },

    -- Orihime Inoue
    ["Orihime Inoue"] = {
        [1] = 59,
        [100] = 60,
    },

    -- Uryu Ishida
    ["Uryu Ishida"] = {
        [1] = 34,
        [100] = 35,
    },

    -- Ulquiorra Ciffer
    ["Ulquiorra Ciffer"] = {
        [1] = 113,
        [100] = 114,
    },

    -- Zaraki Kenpachi
    ["Zaraki Kenpachi"] = {
        [1] = 123,
        [100] = 124,
    },

    -- Byakuya Kuchiki
    ["Byakuya Kuchiki"] = {
        [1] = 85,
        [100] = 86,
    },

    -- Toshiro Histugaya
    ["Toshiro Hitsugaya"] = {
        [1] = 73,
        [100] = 74,
    },

    -- Rukia Kuchiki
    ["Rukia Kuchiki"] = {
        [1] = 20,
        [100] = 21,
    },

    -- Nelliel Odelschwanck
    ["Nelliel Odelschwanck"] = {
        [1] = 97,
        [100] = 98,
    },

    -- Retsu Unohana
    ["Retsu Unohana"] = {
        [1] = 139,
        [100] = 140,
    },

    -- Renjii Abarai
    ["Renjii Abarai"] = {
        [1] = 59,
        [100] = 60,
    },

	-- Gin Ichimaru
	["Gin Ichimaru"] = {
        [1] = 316,
        [100] = 320,
    },

	-- Kuugo Ginjo
	["Kuugo Ginjo"] = {
        [1] = 326,
        [100] = 328,
    },

	-- Tier Halibel
	["Tier Halibel"] = {
        [1] = 321,
        [100] = 324,
    },

	-- Urahara Kisuke
	["Urahara Kisuke"] = {
        [1] = 331,
        [100] = 333,
    }
}

function onAdvance(cid, skill, oldLevel, newLevel)
    local player_vocation_name = getPlayerVocationName(cid)

    if skill ~= SKILL__LEVEL or not VOCATION_REVERT_DEATH[player_vocation_name] then
        return true
    end

    if oldLevel < 100 and newLevel >= 100 and not canPlayerWearOutfit(cid, VOCATION_REVERT_DEATH[player_vocation_name][100]) then
        doPlayerAddOutfit(cid, VOCATION_REVERT_DEATH[player_vocation_name][100], 0)
    end
    return true
end

function onLogin(cid)
    local player_vocation_name = getPlayerVocationName(cid)

    if VOCATION_REVERT_DEATH[player_vocation_name] then
        if not canPlayerWearOutfit(cid, VOCATION_REVERT_DEATH[player_vocation_name][1]) then
            doPlayerAddOutfit(cid, VOCATION_REVERT_DEATH[player_vocation_name][1], 0)
            doCreatureChangeOutfit(cid, {lookType = VOCATION_REVERT_DEATH[player_vocation_name][1]})
        end
    end
    return true
end
