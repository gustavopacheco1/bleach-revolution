local tasksss = {
   [1] = {name = "Beezers",  sto = 10214, count = 25, time_sto = 5458, time = 1*2400*6000*6000, sto_count = 14130, money = 100, rewardid = 13473, rewardcount = 1, rewardexp = 10000,  text = "Obrigado por me ajudar com essa tarefa, acabo de falar com Ibiki, e como forma de bravura pelo seu ato, convenci ele a lher dar um pergaminho, no qual eu mesmo, irei te entregar, parabens jovem Shinobi."},
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    value = -1
    for i = 1, #tasksss do
        if msgcontains(msg, tasksss[i].name) and not value ~= -1 then
            value = i
        end
    end
    if value == -1 then
        selfSay('Para fazer a missao diga, {beezer} ou entao, va terminar sua task... Caso ja tenha terminado, me desculpe, era tudo, que eu precisava.', cid)
        talkState[talkUser] = 0
        return true
    end
    local configss = tasksss[value]
    local name = configss.name
    local m_sto = configss.sto
    local time_sto = configss.time_sto
    local count_sto = configss.sto_count
    local total_count = configss.count
    local rest = total_count - getPlayerStorageValue(cid, count_sto)
        if getPlayerStorageValue(cid, time_sto) < os.time() then -- verifica se o player ainda está no prazo
            if getPlayerStorageValue(cid, m_sto) <= 0 then -- verifica se o player não pegou está task
                selfSay('Entao voce deseja me ajudar? Preciso que voce mate: '.. total_count .. ' '.. name .. '!', cid)
                setPlayerStorageValue(cid, m_sto, 1)
                setPlayerStorageValue(cid, total_count, 0)
                talkState[talkUser] = 0               
            else
                if rest <= 0 then -- Verifica se o player matou todos os monstros nescessários
                    doPlayerAddItem(cid, configss.rewardid, configss.rewardcount)
                    setPlayerStorageValue(cid, count_sto, 0) 
                    setPlayerStorageValue(cid, m_sto, -1) 
                    setPlayerStorageValue(cid, time_sto, os.time() + configss.time)
                    doPlayerAddExperience(cid, configss.rewardexp)
                    doSendAnimatedText(getCreaturePosition(cid), configss.rewardexp, 215)
                    selfSay(configss.text, cid) 
                    talkState[talkUser] = 0
                else
                    selfSay('Voce precisa matar '..rest..' '..name..' para ganhar sua recompensa.', cid)
                    talkState[talkUser] = 0
                end
            end
        else
            selfSay('Voce ja, me ajudou com isso, obrigado.', cid)
            talkState[talkUser] = 0
        end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())