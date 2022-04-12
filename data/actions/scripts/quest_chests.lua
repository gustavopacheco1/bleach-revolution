local questChests = {
	[50000] = {
		storage = "halibel_set_quest",
		-- Halibel Helmet
		items = {11384}
	},
	[50001] = {
		storage = "halibel_set_quest",
		-- Halibel Armor
		items = {16101}
	},
	[50002] = {
		storage = "halibel_set_quest",
		-- Halibel Legs
		items = {16102}
	},
	[50003] = {
		storage = "halibel_set_quest",
		-- Halibel Boots
		items = {16103}
	},

    [50004] = {
        storage = "kensei_set_quest",
        -- Kensei Helmet
        items = {16097}
    },
    [50005] = {
        storage = "kensei_set_quest",
        -- Kensei Armor
        items = {16098}
    },
    [50006] = {
        storage = "kensei_set_quest",
        -- Kensei Legs
        items = {16099}
    },
    [50007] = {
        storage = "kensei_set_quest",
        -- Kensei Boots
        items = {16100}
    },

    [50008] = {
        storage = "zangetsu_set_quest",
        -- Zangetsu Helmet
        items = {16107}
    },
    [50009] = {
        storage = "zangetsu_set_quest",
        -- Zangetsu Armor
        items = {16108}
    },
    [50010] = {
        storage = "zangetsu_set_quest",
        -- Zangetsu Legs
        items = {16109},
    },
    [50011] = {
        storage = "zangetsu_set_quest",
        -- Zangetsu Boots
        items = {16110}
    },

    [50012] = {
        storage = "vizard_set_quest",
        -- Vizard Helmet
        items = {16088}
    },
    [50013] = {
        storage = "vizard_set_quest",
        -- Vizard Armor
        items = {16087}
    },
    [50014] = {
        storage = "vizard_set_quest",
        -- Vizard Legs
        items = {16086}
    },
    [50015] = {
        storage = "vizard_set_quest",
        -- Vizard Boots
        items = {16085}
    },

    [50016] = {
        storage = "kaname_set_quest",
        -- Kaname Helmet
        items = {16089}
    },
    [50017] = {
        storage = "kaname_set_quest",
        -- Kaname Armor
        items = {16090}
    },
    [50018] = {
        storage = "kaname_set_quest",
        -- Kaname Legs
        items = {16091}
    },
    [50019] = {
        storage = "kaname_set_quest",
        -- Kaname Boots
        items = {16092}
    },

    [50020] = {
        storage = "ninja_set_quest",
        -- Ninja Armor, Ninja Legs, Ninja Boots
        items = {15080, 15081, 15082}
    },

    [50021] = {
        storage = "soul_weapons_quest",
        -- Quincy Bow
        items = {15091}
    },
    [50022] = {
        storage = "soul_weapons_quest",
        -- El Diablo Glove
        items = {15730}
    },
    [50023] = {
        storage = "soul_weapons_quest",
        -- Zangetsu
        items = {15820}
    },

    [50024] = {
        storage = "snake_chains_quest",
        -- Snake Ring
        items = {11377}
    },
    [50025] = {
        storage = "snake_chains_quest",
        -- Focus Snake Amulet
        items = {15799}
    },
    [50026] = {
        storage = "snake_chains_quest",
        -- Concentrate Snake Amulet
        items = {15800}
    },

    [50027] = {
        storage = "skeleton_quest",
        -- Skeleton Ring
        items = {15743}
    },
    [50028] = {
        storage = "skeleton_quest",
        -- Red Shield
        items = {15063}
    },
    [50029] = {
        storage = "skeleton_quest",
        -- Black Amulet
        items = {15742}
    },

    [50030] = {
        storage = "fake_zaraki_quest",
        -- Zaraki Ring
        items = {15790}
    },
    [50031] = {
        storage = "fake_zaraki_quest",
        -- Shidoh Shield
        items = {15060}
    },
	
	[50032] = {
        storage = "first_chest",
        -- Inicial Set
        items = {16135,16136,16137}
    },
	
	[50033] = {
        storage = "diamond_chest",
        -- Items diamond
        items = {16131,16132,16133,16134}
    }
}


local function getRewardsWeight(items)
    local weight = 0
    
    for i = 1, #items do
        weight = weight + getItemWeightById(items[i])
    end

    return weight
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local quest_chest_aid = getItemAttribute(item.uid, "aid")

    if not (questChests[quest_chest_aid]) then return end

    if getPlayerStorageValue(cid, questChests[quest_chest_aid].storage) ~= -1 then
        doSendMagicEffect(getCreaturePosition(cid), 2)
        return MultiLanguage.doPlayerSendTextMessage(
            cid,
            MESSAGE_EVENT_ADVANCE,
            "This chest is empty.",
            "Este ba� est� v�zio."
        )
    end

    if getPlayerFreeCap(cid) < getRewardsWeight(questChests[quest_chest_aid].items) then
        return MultiLanguage.doPlayerSendTextMessage(
            cid,
            MESSAGE_EVENT_ADVANCE,
            "You do not have enough capacity.",
            "Voc� n�o tem capacidade suficiente."
        )
    end

    setPlayerStorageValue(cid, questChests[quest_chest_aid].storage, 1)
    for i = 1, #questChests[quest_chest_aid].items do
        doPlayerAddItem(cid, questChests[quest_chest_aid].items[i])
    end
end
