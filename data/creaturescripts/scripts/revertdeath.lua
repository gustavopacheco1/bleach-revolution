local VOCATION_REVERT_DEATH = {
    -- Ichigo Kurosaki
    ["Ichigo Kurosaki"] = {
        [1] = {vocation = 1, looktype = 2},
        [100] = {vocation = 2, looktype = 3},       
    },

    -- Chad
    ["Chad"] = {
        [1] = {vocation = 7, looktype = 157},
        [100] = {vocation = 8, looktype = 158},
	},

    -- Bazz-B
    ["Bazz-B"] = {
        [1] = {vocation = 13, looktype = 148},
        [100] = {vocation = 14, looktype = 149}, 
    },

    -- Orihime Inoue
    ["Orihime Inoue"] = {
        [1] = {vocation = 19, looktype = 59},
        [100] = {vocation = 20, looktype = 60},
    },

    -- Uryu Ishida
    ["Uryu Ishida"] = {
        [1] = {vocation = 25, looktype = 34},
        [100] = {vocation = 26, looktype = 35},
    },

    -- Ulquiorra Ciffer
    ["Ulquiorra Ciffer"] = {
        [1] = {vocation = 31, looktype = 113},
        [100] = {vocation = 32, looktype = 114},
    },

    -- Zaraki Kenpachi
    ["Zaraki Kenpachi"] = {
        [1] = {vocation = 37, looktype = 123},
        [100] = {vocation = 38, looktype = 124},
    },

    -- Byakuya Kuchiki
    ["Byakuya Kuchiki"] = {
        [1] = {vocation = 43, looktype = 85},
        [100] = {vocation = 44, looktype = 86},
    },

    -- Toshiro Histugaya
    ["Toshiro Hitsugaya"] = {
        [1] = {vocation = 49, looktype = 73},
        [100] = {vocation = 50, looktype = 74},
    },

    -- Rukia Kuchiki
    ["Rukia Kuchiki"] = {
        [1] = {vocation = 55, looktype = 20},
        [100] = {vocation = 56, looktype = 21},
    },

    -- Nelliel Odelschwanck
    ["Nelliel Odelschwanck"] = {
        [1] = {vocation = 61, looktype = 97},
        [100] = {vocation = 62, looktype = 98},
    },

    -- Retsu Unohana
    ["Retsu Unohana"] = {
        [1] = {vocation = 68, looktype = 139},
        [100] = {vocation = 69, looktype = 140},
    },

    -- Renjii Abarai
    ["Renjii Abarai"] = {
        [1] = {vocation = 73, looktype = 59},
        [100] = {vocation = 74, looktype = 60},
    },
	
	-- Gin Ichimaru
	["Gin Ichimaru"] = {
        [1] = {vocation = 78, looktype = 316},
        [100] = {vocation = 79, looktype = 320},
    },
	
	-- Kuugo Ginjo
	["Kuugo Ginjo"] = {
        [1] = {vocation = 83, looktype = 326},
        [100] = {vocation = 84, looktype = 328},
    },
	
	-- Tier Halibel
	["Tier Halibel"] = {
        [1] = {vocation = 88, looktype = 321},
        [100] = {vocation = 89, looktype = 324},
    },
	
	-- Urahara Kisuke
	["Urahara Kisuke"] = {
        [1] = {vocation = 93, looktype = 331},
        [100] = {vocation = 94, looktype = 333},
    }
}

local function getNextTransformLevel(cid)
    local levels = {1, 100}
    local next_transform_level = 0

    for i = 1, #levels do
        if getPlayerLevel(cid) >= levels[i] then
            next_transform_level = levels[i]
        end
    end

    return next_transform_level
end

function onLogin(cid)
    local next_transform_level = getNextTransformLevel(cid)
    local player_vocation_name = getPlayerVocationName(cid)

    if getPlayerVocation(cid) > VOCATION_REVERT_DEATH[player_vocation_name][next_transform_level].vocation then    
        doPlayerSetVocation(cid, VOCATION_REVERT_DEATH[player_vocation_name][next_transform_level].vocation)
        doCreatureChangeOutfit(cid, {lookType = VOCATION_REVERT_DEATH[player_vocation_name][next_transform_level].looktype})
    end
    return true
end
