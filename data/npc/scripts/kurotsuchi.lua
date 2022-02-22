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
    [16112] = {price = 100000},
	[16111] = {price = 500000},
	[16118] = {price = 500000},
	[16113] = {price = 300000},
	[16114] = {price = 300000},
	[16116] = {price = 10000},
	[16117] = {price = 10000}
}

function onCreatureSay(cid, type, msg)
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    msg = msg:lower()

    if not npcHandler:isFocused(cid) and getDistanceBetween(getThingPos(cid), getNpcPos()) < 5 then
        if isInArray({"hi", "hello", "oi", "olá"}, msg) then
            npcHandler:addFocus(cid)
            selfSayMultiLanguage(
                "Hello! I sell potions.",
                "Olá! Eu vendo poções.",
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
        
        openShopWindow(cid, shopWindow, creatureSayBuy, creatureSaySell)
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
