local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)npcHandler:onCreatureSay(cid, type, msg:lower()) end
function onThink() npcHandler:onThink() end
function onThink() npcHandler:onThinkCreatureSay() end

local talkState = {}
local playerTrainerTime = {}

function onCreatureSay(cid, type, msg)
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    msg = msg:lower()

    if not npcHandler:isFocused(cid) and getDistanceBetween(getThingPos(cid), getNpcPos()) < 5 then
        if isInArray({"hi", "hello", "oi", "olá"}, msg) then
            playerTrainerTime[cid] = nil
            npcHandler:addFocus(cid)
            selfSayMultiLanguage(
                "Welcome to the Karakura Academy! Here you can train for free. However, if you you {pay} an amount of ryos, I can configure those Punching Bags to fight back your attacks, so you can train your dodge.",
                "Seja bem vindo à Academia de Karakura! Aqui você pode treinar de graça. Porém, se você {pagar} uma quantia de ryos, eu posso configurar esses Punching Bags para revidar seus ataques para você conseguir treinar sua esquiva.",
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

    if isInArray({"pay", "pagar"}, msg) then
        selfSayMultiLanguage(
            "For how long would you like to train? You will pay 600000 ryos per hour.",
            "Por quanto tempo você gostaria de treinar? Você irá pagar 600000 ryos por hora.",
            cid
        )
        talkState[talkUser] = 1
        return true
    end

    if talkState[talkUser] == 1 and tonumber(msg) then
        msg = tonumber(msg)
        if msg <= 0 then
            return false
        end

        if msg > 12 then
            selfSayMultiLanguage(
                "Sorry, you can only buy max 12 hours.",
                "Desculpe, você só pode comprar no máximo 12 horas.",
                cid
            )
            return false
        end

        playerTrainerTime[cid] = msg
        talkState[talkUser] = 2
        local trainer_time_price = playerTrainerTime[cid] * 600000
        
        if exhaustion.check(cid, "trainer_shielding") then
            local trainer_time = exhaustion.get(cid, "trainer_shielding")
            local format_trainer_time = getFormatedTime(cid, disp_time(trainer_time))

            if msg < (trainer_time/3600) then
                selfSayMultiLanguage(
                    "You can't buy a training time lower than the one that you already have. You still have " .. format_trainer_time .. " for training your dodge.",
                    "Você não pode comprar um tempo de treino menor do que o que você já tem. Você ainda tem " .. format_trainer_time .. " para trainer sua esquiva.",
                    cid
                )
                return false
            end
        
            selfSayMultiLanguage(
                "Do you want to pay " .. trainer_time_price .. " ryos for being able to train your dodge skills for " .. playerTrainerTime[cid] .." hours? You still have " .. format_trainer_time .. " for training your dodge.",
                "Você deseja pagar " .. trainer_time_price .. " Ryos coins para conseguir treinar suas habilidades de esquiva por " .. playerTrainerTime[cid] .." horas? Você ainda possui " .. format_trainer_time .. " para treinar sua esquiva.",
                cid
            )
            return true
        end

        selfSayMultiLanguage(
            "Do you want to pay " .. trainer_time_price .. " ryos for being able to train your dodge skills for " .. playerTrainerTime[cid] .." hours?",
            "Você deseja pagar " .. trainer_time_price .. " ryos para conseguir treinar suas habilidades de esquiva por " .. playerTrainerTime[cid] .." horas?",
            cid
        )

        return true
    end

    if isInArray({"yes", "sim"}, msg) and talkState[talkUser] == 2 then
        if not (doPlayerRemoveMoney(cid, playerTrainerTime[cid] * 600000)) then
            selfSayMultiLanguage(
                "Sorry, you do not have enough money.",
                "Desculpe, você não tem dinheiro suficiente.",
                cid
            )
            return false
        end

        selfSayMultiLanguage(
            "Thank you very much for collaborating with the Karakura Academy. Now you can train your dodge for " .. playerTrainerTime[cid] .. " hours.",
            "Muito obrigado por colaborar com a Academia de Karakura. Agora você pode treinar sua esquiva por " .. playerTrainerTime[cid] .. " horas.",
            cid
        )

        exhaustion.set(cid, "trainer_shielding", playerTrainerTime[cid] * 3600)

        talkState[talkUser] = nil
        playerTrainerTime[cid] = nil
        npcHandler:releaseFocus(cid)
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
