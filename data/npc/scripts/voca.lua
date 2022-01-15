local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	

local storage = 67413
local item = 11471   --- Item ID do item que será cobrado
local itemcost =  20   --- Quantidade do item que será cobrado

	if msgcontains(msg, 'madara') then
	 if getPlayerItemCount(cid, item) <= itemcost then
	  selfSay('Voce nao tem a 20 premium points, lamento', cid)
	   else
		if getPlayerStorageValue(cid, storage) == -1 then
	        doPlayerRemoveItem(cid, item, itemcost)
			doPlayerSetVocation(cid, 250)
			doSendMagicEffect(getPlayerPosition(cid), 28)		
			selfSay('Parabéns {'..getPlayerName(cid)..'} agora você é um Madara!', cid)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Parabens, agora voce e uma Vocation VIP e tem bastante poder !')
		else
			selfSay('Desculpe {'..getPlayerName(cid)..'} mais você já tem uma vocação!', cid)
		end
		end

	elseif msgcontains(msg, 'minato') then
	 if getPlayerItemCount(cid, item) <= itemcost then
	  selfSay('Voce nao tem a 20 premium points, lamento', cid)
	   else
		if getPlayerStorageValue(cid, storage) == -1 then
		    doPlayerRemoveItem(cid, item, itemcost)
			doPlayerSetVocation(cid, 265)
			doSendMagicEffect(getPlayerPosition(cid), 28)		
			selfSay('Parabéns {'..getPlayerName(cid)..'} agora você é um Minato!', cid)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Parabens, agora voce e uma Vocation VIP e tem bastante poder !')
		else
			selfSay('Desculpe {'..getPlayerName(cid)..'} mais você já tem uma vocação!', cid)
		end
		end

	elseif msgcontains(msg, 'hashirama') then
	 if getPlayerItemCount(cid, item) <= itemcost then
	  selfSay('Voce nao tem a 20 premium points, lamento', cid)
	   else
		if getPlayerStorageValue(cid, storage) == -1 then
		    doPlayerRemoveItem(cid, item, itemcost)
			doPlayerSetVocation(cid, 280)
			doSendMagicEffect(getPlayerPosition(cid), 28)		
			selfSay('Parabéns {'..getPlayerName(cid)..'} agora você é um Hashirama!', cid)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Parabens, agora voce e uma Vocation VIP e tem bastante poder !')
		else
			selfSay('Desculpe {'..getPlayerName(cid)..'} mais você já tem uma vocação!', cid)
		end
		end

	elseif msgcontains(msg, 'tobirama') then
	 if getPlayerItemCount(cid, item) <= itemcost then
	  selfSay('Voce nao tem a 20 premium points, lamento', cid)
	   else
		if getPlayerStorageValue(cid, storage) == -1 then
		    doPlayerRemoveItem(cid, item, itemcost)
			doPlayerSetVocation(cid, 295)
			doSendMagicEffect(getPlayerPosition(cid), 28)		
			selfSay('Parabéns {'..getPlayerName(cid)..'} agora você é um Tobirama!', cid)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Parabens, agora voce e uma Vocation VIP e tem bastante poder !')
		else
			selfSay('Desculpe {'..getPlayerName(cid)..'} mais você já tem uma vocação!', cid)
		end
		end
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  