local config = {
storage = 19400, -- storage em que será salvo o tempo
cor = "green", -- de acordo com o constant.lua da lib
tempo = 5, -- em minutos
itemid = 2160,
price = 100, -- quantidade de dinheiro que irá custar
level = 100 -- level pra poder utilizar o broadcast
}
 
 
function onSay(cid, words, param, channel)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
return true
end
 
 
if getPlayerLevel(cid) >= config.level then
if getPlayerStorageValue(cid, config.storage) - os.time() <= 0 then
if doPlayerRemoveItem(cid, config.itemid, config.price) then
setPlayerStorageValue(cid, config.storage, os.time() + (config.tempo*1)) 
doBroadcastMessage(""..getCreatureName(cid).." : "..param.."", config.cor)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Você enviou com sucesso um Anuncio, agora você vai ter que esperar " ..config.tempo.. " second(s) until you broadcast again.")
else
doPlayerSendCancel(cid, "You don't have " ..config.price.. " Dollar's Voce não tem Thousand Dollar Suficiente.")
return true
end
else
doPlayerSendCancel(cid, "You have to wait " ..(getPlayerStorageValue(cid, config.storage) - os.time()).. " seconds until you can broadcast again.")
return true
end
else
doPlayerSendCancel(cid, "You have to be level " ..config.level.. " or more in order to use broadcast.")
end
return true
end