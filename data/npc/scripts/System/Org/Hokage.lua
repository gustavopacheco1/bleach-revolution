---- NPC Trader por Killua, antigo amoeba13 ----


local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}


function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end
 
 focus = 0
 talk_start = 0
 target = 0
 following = false
 attacking = false

		function onCreatureAppear(creature)
		end

		function onCreatureDisappear(cid, pos)
		if focus == cid then
         npcHandler:say('Good bye then.', cid)
         focus = 0
         talk_start = 0
		end
		end

		function msgcontains(txt, str)
		return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
		end


		function onCreatureSay(cid, type, msg)
		msg = string.lower(msg)
		if (msgcontains(msg, 'hi') or msgcontains(msg, 'hello')) and (focus == 0) and getNpcDistanceToCreature(cid) < 4 then
		if getPlayerStorageValue(cid, 8998) < 1 then
        npcHandler:say('Olá, me chamo Tatsuya, atualmente, sou quem mantêm o poder das Bijuus guardados em seus respectivos Chakras, porém, a aqueles que se mostrarem capaz de juntar 100 almas das mesmas, poderá adquirir tal poder. ', cid)
		focus = cid
		talk_start = os.clock()
		else
		npcHandler:say('Eu lamento ' .. getCreatureName(cid) .. ' , mas voce ja se tornou Hokage.', cid)
		focus = 0
 		talk_start = 0
		end

		elseif string.find(msg, '(%a*)hi(%a*)') and (focus ~= cid) and getNpcDistanceToCreature(cid) < 4 then
 		npcHandler:say('Sorry, I talk to you in a minute.', cid)
		elseif focus == cid then
		talk_start = os.clock()
		local item_id = 13468
		if msgcontains(msg, 'sim') and getPlayerItemCount(cid, 13468) >= 1 then
		playerLearnInstantSpell(cid,"fuumetsu") -- SPELLS --
			 doPlayerAddItem(cid, 6227, 1) -- ITEMS -- 
			 doPlayerAddItem(cid, 6272, 1)
			 doPlayerAddItem(cid, 2411, 1)
			 doPlayerAddItem(cid, 2179, 1)
			 doPlayerRemoveItem(cid, 13468, 1)
		broadcastMessage('[ATENCAO SHINNOBIS] O player ' .. getCreatureName(cid) .. ' acaba de selar o poder de uma bijuu, tenham cuidado com o mesmo, pois ele e portador de um grande poder.') -- [ALL] MENSAGEM AO VIRAR A ORG 
		setPlayerStorageValue(cid, 8999, 1) -- STORAGE - ORG ITACHI
        doPlayerSendTextMessage(cid,22,"Parabens agora voce faz parte da Akatsuki.") -- [PLAYER] MENSAGEM AO VIRAR A ORG
 		talk_start = os.clock()
		else
		npcHandler:say('Nao tente me enganar {' .. getCreatureName(cid) .. '}, voce nao possui o pergaminho', cid)
		end

		
		if string.find(msg, '(%a*)bye(%a*)') and focus == cid and getNpcDistanceToCreature(cid) < 3 then
 		npcHandler:say('Foi dialogar contigo.', cid)
 		focus = 0
 		talk_start = 0
		end
		end
end
