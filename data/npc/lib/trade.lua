buyable_items = {
    ["Ururu Tsumugiya"] = {
        [2293] = {price = 2000}
    },

    ["Hikari"] = {
        [2667] = {price = 2000},
        [2666] = {price = 2000},
        [2676] = {price = 2000},
        [2696] = {price = 2000},
        [6574] = {price = 2000}
    },

    ["Kurotsuchi"] = {
        [16112] = {price = 100000},
        [16111] = {price = 500000},
        [16118] = {price = 500000},
        [16113] = {price = 300000},
        [16114] = {price = 300000},
        [16116] = {price = 10000},
        [16117] = {price = 10000}
    }
}

sellable_items = {
    ["Kenji"] = {
        [15111] = {price = 100000},
        [15724] = {price = 100000},
        [15815] = {price = 100000},
        [16115] = {price = 100000},
        [15103] = {price = 150000},
        [15104] = {price = 50000},
        [15105] = {price = 50000},
        [15772] = {price = 200000},
        [15150] = {price = 50000},
        [15102] = {price = 250000},
        [15099] = {price = 150000}
    },
}

function creatureSayBuy(cid, itemid, subType, amount, ignoreCap, inBackpacks)
    local shopItem = buyable_items[getCreatureName(getNpcId())][itemid]

    local backpack = 1988
    local totalCost = amount * shopItem.price
    if(inBackpacks) then
        totalCost = totalCost + 20 or totalCost + (math.max(1, math.floor(amount / getContainerCapById(backpack))) * 20)
    end

    local parseInfo = {
        [TAG_PLAYERNAME] = getPlayerName(cid),
        [TAG_ITEMCOUNT] = amount,
        [TAG_TOTALCOST] = totalCost,
        [TAG_ITEMNAME] = getItemNameById(itemid)
    }

    if(subType < 1 or getItemInfo(itemid).stackable) then
        subType = -1
    end

    if(getPlayerMoney(cid) < totalCost) then
        local msg = NpcHandler:getMessage(cid, MESSAGE_NEEDMONEY)
        doPlayerSendCancel(cid, NpcHandler:parseMessage(msg, parseInfo))
        return false
    end

    local a, b, item = doNpcSellItem(cid, itemid, amount, subType, ignoreCap, inBackpacks, backpack)
    
    if(a < amount) then
        local msgId = MESSAGE_NEEDMORESPACE
        if(a == 0) then
            msgId = MESSAGE_NEEDSPACE
        end
        

        local msg = NpcHandler:getMessage(cid, msgId)
        parseInfo[TAG_ITEMCOUNT] = a

        doPlayerSendCancel(cid, NpcHandler:parseMessage(msg, parseInfo))
        if(a > 0) then
        
            local prev_money = getPlayerMoney(cid)
            local removeMoney = doPlayerRemoveMoney(cid, (a * shopItem.price) + (b * 20), false)
            
            if removeMoney == true then
                parseInfo[TAG_TOTALCOST] = a * shopItem.price
                local msg = NpcHandler:getMessage(cid, MESSAGE_BOUGHT)
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, NpcHandler:parseMessage(msg, parseInfo))
            else
                for i = 1, #item do
                    doRemoveItem(item[i])
                end
                
                local currentMoney = getPlayerMoney(cid)
                if currentMoney ~= prev_money and  currentMoney < prev_money then -- Let's make sure the player did not pay for an item he did not receive.
                    doPlayerAddMoney(cid, math.abs(prev_money - currentMoney))
                end
                
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don't have enough space to receive the change when buying "..amount.. "x ".. getItemNameById(itemid).."!")
            end
            return true
        end

        return false
    else
    
        local prev_money = getPlayerMoney(cid)
        
        if doPlayerRemoveMoney(cid, totalCost, false) == true then
            local msg = NpcHandler:getMessage(cid, MESSAGE_BOUGHT)
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, NpcHandler:parseMessage(msg, parseInfo))
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don't have enough space to receive the change when buying "..amount.. "x ".. getItemNameById(itemid).."!")
            for i = 1, #item do
                doRemoveItem(item[i])
            end
            
            local currentMoney = getPlayerMoney(cid)
            if currentMoney ~= prev_money and  currentMoney < prev_money then -- Let's make sure the player did not pay for an item he did not receive.
                doPlayerAddMoney(cid, math.abs(prev_money - currentMoney))
            end
            
        end
        return true
    end
end

function creatureSaySell(cid, itemid, subType, amount, ignoreEquipped, dummy)
    local shopItem = sellable_items[getCreatureName(getNpcId())][itemid]

    local parseInfo = {
        [TAG_PLAYERNAME] = getPlayerName(cid),
        [TAG_ITEMCOUNT] = amount,
        [TAG_TOTALCOST] = amount * shopItem.price,
        [TAG_ITEMNAME] = getItemNameById(itemid)
    }

    if(subType < 1 or getItemInfo(itemid).stackable) then
        subType = -1
    end

    if(doPlayerRemoveItem(cid, itemid, amount, subType, ignoreEquipped)) then
        local msg = NpcHandler:getMessage(cid, MESSAGE_SOLD)
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, NpcHandler:parseMessage(msg, parseInfo))

        doPlayerAddMoney(cid, amount * shopItem.price)
        return true
    end

    local msg = NpcHandler:getMessage(cid, MESSAGE_NEEDITEM)
    doPlayerSendCancel(cid, NpcHandler:parseMessage(msg, parseInfo))
    return false
end
