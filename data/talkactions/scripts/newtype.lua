local quantidadeDeOutfits = 1500 -- < coloque a quantidade de outfits do seu servidor.

function onSay(cid, words, param, channel)

if(param == "") then
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Complemente o comando com o parametro adequado.")
end

param = string.explode(param, ",")

if (words == "/newtype") and (not param[2]) then 
if (tonumber(param[1]) <= quantidadeDeOutfits) then 
doCreatureChangeOutfit(cid, {lookType = param[1]})
setPlayerStorageValue(cid, 578955, getCreatureOutfit(cid).lookType)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Esta Outfit nao existe.")
end
else
doCreatureChangeOutfit(getPlayerByName(param[2]), {lookType = param[1]})
setPlayerStorageValue(getPlayerByName(param[2]), 578955, getCreatureOutfit(cid).lookType)
end
		
return true 
end