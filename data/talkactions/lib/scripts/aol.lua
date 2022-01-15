local items = {2647, 2650, 2661, 2668, 2393, 2396, 2395} ----- ID dos 7 items que serao removidos

function onSay(cid, words, param)
        if doPlayerRemoveItem(items.cid, 1) == true then -- Quantidade dos items que serao removidos , ex , se colocar 2 , sera removido 2 items de cada 
		doPlayerAddItem(cid, 2160, 100) -- Id da Wand e a quantidade que sera adicionada , ex , se colocar 2 no lugar de 1 , sera entregue 2 wand apos a troca
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,'Voce acaba de trocar os 7 items por uma Wand') -- Mensagem caso o player possua os 7 items e efetue a troca
		else
        doPlayerSendCancel(cid, "Voce nao possui os 7 items necessarios para efetuar a troca.")  -- Mensagem caso o player nao possua os 7 items
        end
		return true
        end
