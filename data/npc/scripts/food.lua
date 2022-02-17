local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)npcHandler:onCreatureSay(cid, type, msg:lower()) end
function onThink() npcHandler:onThink() end
function onThink() npcHandler:onThinkCreatureSay() end

local talkState = {}

-- [id do item] = {price = preço}
local trade_items = {
    [2667] = {price = 2000},
	[2666] = {price = 2000},
	[2676] = {price = 2000},
	[2696] = {price = 2000},
	[6574] = {price = 2000}
}

local function onBuy(cid, itemid, subType, amount, ignoreCap, inBackpacks)
    local shopItem = trade_items[itemid]

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

function onCreatureSay(cid, type, msg)
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    msg = msg:lower()

    if not npcHandler:isFocused(cid) and getDistanceBetween(getThingPos(cid), getNpcPos()) < 5 then
        if isInArray({"hi", "hello", "oi", "olá"}, msg) then
            npcHandler:addFocus(cid)
            selfSayMultiLanguage(
                "Hello! I sell some foods.",
                "Olá! Eu vendo algumas comidas.",
                cid
            )
            return true
        end
    end
    
    if isInArray({"bye", "goodbye", "tchau", "adeus"}, msg) and npcHandler:isFocused(cid) then
        npcHandler:releaseFocus(cid)
        selfSayMultiLanguage(
            "Goodbye!",
            "Adeus!",
            cid
        )
        return true
    end

    if (not npcHandler:isFocused(cid)) then
        return false
    end

    if isInArray({"trade", "offer"}, msg) then
        selfSayMultiLanguage(
            'Here\'s my offer, ' .. getPlayerName(cid) .. '. Don\'t you like it?',
            'Aqui está minha oferta, ' .. getPlayerName(cid) .. '. Você não gostou?',
            cid
        )

        local shopWindow = {}
        for var, ret in pairs(trade_items) do
            table.insert(shopWindow, {
                id = var,
                subType = 0,
                buy = ret.price,
                sell = 0,
                name = getItemNameById(var)
            })
        end
        
        openShopWindow(cid, shopWindow, onBuy, onSell)
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
