local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg:lower())   end
function onThink()                  npcHandler:onThink()                  end
local talkState = {}

-- Itens para entregar ao npc
-- {Id, Quantidade, Level}
local craft_items = {
    {id = 2671, amount = 6},
}

-- Id do item que o player receberá
local reward_item_id = 2376

function creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
      return false
   end
 
   local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if msgcontains(msg, "entregar") then
        for item_count = 1, #craft_items do
            if getPlayerItemCount(cid, craft_items[item_count].id) < craft_items[item_count].amount then
                selfSayMultiLanguage(
                    "You do not have the needed items.",
                    "Você não tem os items necessários",
                    cid
                )
                return true
            end
        end

        for item_count_remove = 1, #craft_items do
            doPlayerRemoveItem(cid, craft_items[item_count_remove].id, craft_items[item_count_remove].amount)
        end

        doPlayerAddItem(cid, reward_item_id, 1)
        selfSayMultiLanguage(
            "Thank you very much for collaborating. Here's your reward!",
            "Muito obrigado por colaborar. Aqui está sua recompensa!",
            cid
        )
	end
    return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
