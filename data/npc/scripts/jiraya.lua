local item_1 = 12700 -- ID do item necessário para a troca
local item_2 = 12701 -- ID do item que recebe ao dar item_1

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, "troca") then
		if getPlayerStorageValue(cid, 5234) < 1 then
			if getPlayerItemCount(cid, item_1) == 1 then
				npcHandler:say("Voce tem certeza, que quer me entregar o Icha Icha, pelo Ticket do Spar?", cid);
			else
				npcHandler:say("Você nao possui o Icha Icha me entregar.", cid);
			end
		else
			npcHandler:say("Eu ja lhe dei o seu Ticket.", cid);
		end
	elseif msgcontains(msg, "sim") and getPlayerItemCount(cid, item_1) == 1 then
		npcHandler:say("Aqui esta o seu Ticket!", cid);
		doPlayerRemoveItem(cid, item_1, 1);
		doPlayerAddItem(cid, item_2, 1);
		doPlayerSetStorageValue(cid, 5234, 1);
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())