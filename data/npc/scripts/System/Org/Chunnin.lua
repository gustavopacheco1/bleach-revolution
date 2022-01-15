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
        npcHandler:say("Entao voce e o famoso |PLAYERNAME|, bom, eu me chamo Ibiki, e ouvi falar muito de voce, por estar ajudando a comunidade... Eu, atualmente sou o representante do conselho Shinobi, qualificado para preparar e transformar todos os {Gennin's} em {Chunnin's}, mas para isso, todos devem mostrar que sao capazes, por isso, criamos um sistema, de avaliar os meros estudantes da academia... Sendo assim, todos que desejam, virar {Chunnin} precisam de {2 Pergaminhos Rank: C} e 2 {Pergaminhos Rank: D}, caso os possua, e queira se tornar um {Chunnin}, diga {sim}.", cid)
		focus = cid
		talk_start = os.clock()
		else
		npcHandler:say('Eu lamento ' .. getCreatureName(cid) .. ' , mas voce ja se tornou Chunnin.', cid)
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
		doPlayerRemoveItem(cid, 13472, 2)
		doPlayerRemoveItem(cid, 13473, 2)
		broadcastMessage('[ATENCAO SHINNOBIS] O player ' .. getCreatureName(cid) .. ' acaba de se tornar Chunnin, tenham cuidado com o mesmo, pois ele e portador de um grande poder.') -- [ALL] MENSAGEM AO VIRAR A ORG 
		setPlayerStorageValue(cid, 9000, 1) -- STORAGE - ORG ITACHI
        doPlayerSendTextMessage(cid,22,"Parabens agora voce faz parte da comunidade Chunnin.") -- [PLAYER] MENSAGEM AO VIRAR A ORG
 		talk_start = os.clock()
		else
		npcHandler:say('Nao tente me enganar {' .. getCreatureName(cid) .. '}, voce nao possui os pergaminhos necessarios', cid)
		end

		
		if string.find(msg, '(%a*)bye(%a*)') and focus == cid and getNpcDistanceToCreature(cid) < 3 then
 		npcHandler:say('Foi bom dialogar contigo.', cid)
 		focus = 0
 		talk_start = 0
		end
		end
end
