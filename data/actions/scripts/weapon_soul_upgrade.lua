local weapons = {
    ["Zangetsu"] = {max_souls = 1000, upgrade_to = 15122},
    ["Bankai Zangetsu"] = {max_souls = 2000, upgrade_to = 15411},
    ["Legendary Bankai Zangetsu"] = {max_souls = 5000, upgrade_to = 15412},

    ["El Diablo Glove"] = {max_souls = 1000, upgrade_to = 15819},
    ["Brazo El Diablo"] = {max_souls = 2000, upgrade_to = 15431},
    ["Legendary Brazo El Diablo"] = {max_souls = 5000, upgrade_to = 15432},

    ["Quincy Bow"] = {max_souls = 1000, upgrade_to = 15823},
    ["Lanza Del Relampago"] = {max_souls = 2000, upgrade_to = 15423},
    ["Legendary Lanza Del Relampago"] = {max_souls = 5000, upgrade_to = 15424}
}

local upgrade_items_id = {
    [10624] = {soul_upgrade = 20},
	[10625] = {soul_upgrade = 30},
	[10626] = {soul_upgrade = 40},
	[10627] = {soul_upgrade = 50}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if upgrade_items_id[item.itemid] then    
        if not weapons[getItemInfo(itemEx.itemid).name] then return end
        
        -- We need to set item attribute by function for using getItemAttribute
        if getItemAttribute(itemEx.uid, "description") == nil then
            doItemSetAttribute(itemEx.uid, "description", "Soul: 0")
        end
        
        local weapon = weapons[getItemInfo(itemEx.itemid).name]
        local weapon_soul_amount = tonumber(string.explode(getItemAttribute(itemEx.uid, "description"), " ")[2])
        
        if weapon_soul_amount >= weapon.max_souls then
            MultiLanguage.doPlayerSendCancel(
                cid,
                "This weapon has already reached its maximum capacity of souls.",
                "Esta arma já alcançou sua capacidade máxima de souls."
            )
            return true
        end
        
        if (weapon_soul_amount + upgrade_items_id[item.itemid].soul_upgrade) > weapon.max_souls then
            doItemSetAttribute(itemEx.uid, "description", "Soul: " .. tostring(weapon.max_souls))
        else
            doItemSetAttribute(itemEx.uid, "description", "Soul: " .. tostring(weapon_soul_amount + upgrade_items_id[item.itemid].soul_upgrade))
        end
        
        doSendMagicEffect(fromPosition, 13)
        doRemoveItem(item.uid, 1)
        return true
    end

    if weapons[getItemInfo(item.itemid).name] then
        -- ItemEx must have actionid 30000
        if not (getItemAttribute(itemEx.uid, "uid") == 30000) then return end

        -- We need to set item attribute by function for using getItemAttribute
        if getItemAttribute(item.uid, "description") == nil then return end

        local weapon = weapons[getItemInfo(item.itemid).name]
        local weapon_soul_amount = tonumber(string.explode(getItemAttribute(item.uid, "description"), " ")[2])

        if weapon_soul_amount < weapon.max_souls then
            return MultiLanguage.doPlayerSendCancel(
                cid,
                "This weapon needs to reach " .. weapon.max_souls .. " souls to be upgraded.",
                "Esta arma precisa atingir " .. weapon.max_souls .. " souls para ser melhorada."
            )
        end

        doSendMagicEffect({
            x = toPosition.x + 2,
            y = toPosition.y + 2,
            z = toPosition.z
        }, 725)

        doTransformItem(item.uid, weapon.upgrade_to)
        if weapons[getItemInfo(weapon.upgrade_to).name] then
            doItemSetAttribute(item.uid, "description", "Soul: 0")
        else
            doItemSetAttribute(item.uid, "description", "")
        end
    end
    return true
end
