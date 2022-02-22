local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)npcHandler:onCreatureSay(cid, type, msg:lower()) end
function onThink() npcHandler:onThink() end
function onThink() npcHandler:onThinkCreatureSay() end

local talkState = {}

-- [id do item] = {price = pre�o}
local trade_items = {
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
}

function onCreatureSay(cid, type, msg)
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    msg = msg:lower()

    if not npcHandler:isFocused(cid) and getDistanceBetween(getThingPos(cid), getNpcPos()) < 5 then
        if isInArray({"hi", "hello", "oi", "ol�"}, msg) then
            npcHandler:addFocus(cid)
            selfSayMultiLanguage(
                "Hello! I buy some items.",
                "Ol�! Eu compro alguns itens.",
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
            'Aqui est� minha oferta, ' .. getPlayerName(cid) .. '. Voc� n�o gostou?',
            cid
        )

        local shopWindow = {}
        for var, ret in pairs(trade_items) do
            table.insert(shopWindow, {
                id = var,
                subType = 0,
                buy = 0,
                sell = ret.price,
                name = getItemNameById(var)
            })
        end
        
        openShopWindow(cid, shopWindow, creatureSayBuy, creatureSaySell)
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())