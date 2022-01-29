local VOCATION_REVERT_DEATH = {
    -- Ichigo Kurosaki
    ["Ichigo Kurosaki"] = {
        [1] = {vocation = 1, looktype = 2},
        [100] = {vocation = 2, looktype = 3},
        [200] = {vocation = 3, looktype = 4},
        [300] = {vocation = 4, looktype = 5},
        [400] = {vocation = 5, looktype = 6},
        
    },

    -- Chad
    ["Chad"] = {
        [1] = {vocation = 7, looktype = 157},
        [100] = {vocation = 8, looktype = 158},
        [200] = {vocation = 9, looktype = 159},
        [300] = {vocation = 10, looktype = 160},
        [400] = {vocation = 11, looktype = 161},
	},

    -- Bazz-B
    ["Bazz-B"] = {
        [1] = {vocation = 13, looktype = 148},
        [100] = {vocation = 14, looktype = 149},
        [200] = {vocation = 15, looktype = 150},
        [300] = {vocation = 16, looktype = 151},
        [400] = {vocation = 17, looktype = 152},  
    },

    -- Orihime Inoue
    ["Orihime Inoue"] = {
        [1] = {vocation = 19, looktype = 59},
        [100] = {vocation = 20, looktype = 60},
        [200] = {vocation = 21, looktype = 61},
        [300] = {vocation = 22, looktype = 62},
        [400] = {vocation = 23, looktype = 63},
    },

    -- Uryu Ishida
    ["Uryu Ishida"] = {
        [1] = {vocation = 25, looktype = 34},
        [100] = {vocation = 26, looktype = 35},
        [200] = {vocation = 27, looktype = 36},
        [300] = {vocation = 28, looktype = 37},
        [400] = {vocation = 29, looktype = 38},
    },

    -- Ulquiorra Ciffer
    ["Ulquiorra Ciffer"] = {
        [1] = {vocation = 31, looktype = 113},
        [100] = {vocation = 32, looktype = 114},
        [200] = {vocation = 33, looktype = 115},
        [300] = {vocation = 34, looktype = 116},
        [400] = {vocation = 35, looktype = 117},
    },

    -- Zaraki Kenpachi
    ["Zaraki Kenpachi"] = {
        [1] = {vocation = 37, looktype = 123},
        [100] = {vocation = 38, looktype = 124},
        [200] = {vocation = 39, looktype = 125},
        [300] = {vocation = 40, looktype = 126},
        [400] = {vocation = 41, looktype = 127},
    },

    -- Byakuya Kuchiki
    ["Byakuya Kuchiki"] = {
        [1] = {vocation = 43, looktype = 85},
        [100] = {vocation = 44, looktype = 86},
        [200] = {vocation = 45, looktype = 87},
        [300] = {vocation = 46, looktype = 88},
        [400] = {vocation = 47, looktype = 89},
    },

    -- Toshiro Histugaya
    ["Toshiro Histugaya"] = {
        [1] = {vocation = 49, looktype = 73},
        [100] = {vocation = 50, looktype = 74},
        [200] = {vocation = 51, looktype = 75},
        [300] = {vocation = 52, looktype = 76},
        [400] = {vocation = 53, looktype = 77},
    },

    -- Rukia Kuchiki
    ["Rukia Kuchiki"] = {
        [1] = {vocation = 55, looktype = 20},
        [100] = {vocation = 56, looktype = 21},
        [200] = {vocation = 57, looktype = 22},
        [300] = {vocation = 58, looktype = 23},
        [400] = {vocation = 59, looktype = 24},
    },

    -- Nelliel Odelschwanck
    ["Nelliel Odelschwanck"] = {
        [1] = {vocation = 61, looktype = 97},
        [100] = {vocation = 62, looktype = 98},
        [200] = {vocation = 63, looktype = 99},
        [300] = {vocation = 64, looktype = 100},
        [400] = {vocation = 65, looktype = 101},
    },

    -- Retsu Unohana
    ["Retsu Unohana"] = {
        [1] = {vocation = 68, looktype = 139},
        [100] = {vocation = 68, looktype = 140},
        [200] = {vocation = 69, looktype = 141},
        [300] = {vocation = 70, looktype = 142},
        [400] = {vocation = 71, looktype = 143},
    },

    -- Renjii Abarai
    ["Renjii Abarai"] = {
        [1] = {vocation = 73, looktype = 59},
        [100] = {vocation = 74, looktype = 60},
        [200] = {vocation = 75, looktype = 61},
        [300] = {vocation = 76, looktype = 62},
        [400] = {vocation = 77, looktype = 63},
    },
}

local function getNextTransformLevel(cid)
    local levels = {1, 100, 200, 300, 400}
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
