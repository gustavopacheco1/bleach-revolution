local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)npcHandler:onCreatureSay(cid, type, msg:lower()) end
function onThink() npcHandler:onThink() end
function onThink() npcHandler:onThinkCreatureSay() end

local talkState = {}
local travelState = {}

-- ["nome da cidade em minúsculo"] = {"nome da cidade certo", gold, posição para onde o player irá teleportar, posição do npc da cidade}
local cities = {
    ["karakura"] = {"Karakura", 300, {x = 3513, y = 3443, z = 6}, {x = 3512, y = 3443, z = 6}},
    ["silbern"] = {"Silbern", 300, {x = 3783, y = 3525, z = 6}, {x = 3781, y = 3525, z = 6}}
}

function onCreatureSay(cid, type, msg)
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    local npcPos = getNpcPos()
    msg = msg:lower()

    if not npcHandler:isFocused(cid) and getDistanceBetween(getThingPos(cid), getNpcPos()) < 5 then
        if isInArray({"hi", "hello", "oi", "olá"}, msg) then
            npcHandler:addFocus(cid)
            travelState[cid] = nil
            selfSayMultiLanguage(
                "Hello, I'm Minoru. I help randoms to travel between the cities. I can take you to {Karakura} and {Silbern}. Where do you want to go?",
                "Olá, eu me chamo Minoru. Ajudo os randoms a navegarem pelas cidades. Eu posso te levar para {Karakura} e {Silbern}. Onde deseja ir?",
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

    if cities[msg] then
        if (npcPos.x == cities[msg][4].x and npcPos.y == cities[msg][4].y and npcPos.z == cities[msg][4].z) then
            selfSayMultiLanguage(
                "We're already in " .. cities[msg][1] .. ".",
                "Nós já estamos em " .. cities[msg][1] .. ".",
                cid
            )
            return true
        end

        selfSayMultiLanguage(
            "Are you sure you want to travel to " .. cities[msg][1] .. " for " .. cities[msg][2] .. " ryos?",
            "Você tem certeza que deseja viajar para " .. cities[msg][1] .. " por " .. cities[msg][2] .. " ryos?",
            cid
        )
        travelState[cid] = msg
        return true
    end

    if travelState[cid] == nil then return end

    if msgcontains(msg, "yes") then
        if not(doPlayerRemoveMoney(cid, cities[travelState[cid]][2])) then
            selfSayMultiLanguage(
                "You do not have enough ryos.",
                "Você não tem ryos suficiente.",
                cid
            )
            return true
        end

        selfSayMultiLanguage(
            "Goodbye!",
            "Adeus!",
            cid
        )
        doTeleportThing(cid, cities[travelState[cid]][3])
        npcHandler:releaseFocus(cid)
    end
    
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
