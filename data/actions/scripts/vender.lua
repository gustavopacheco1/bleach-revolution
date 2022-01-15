local agora = os.time()
local tempo = 7   -- dias para pegar o item novamente
local config = tempo * (86400*7)
local somatempo = agora + config
function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid,9844) > agora then
doPlayerSendTextMessage(cid,25,"voce so pode pegar um armor") 
return true
end
if getPlayerStorageValue(cid,9843) <= agora then
doPlayerSendTextMessage(cid,25,"Parabens , voce pegou o armor") -- Mensagem que vai aparecer ao player, puxar a alavanca.
setPlayerStorageValue(cid,9843,somatempo) -- só mude a storage se ja estiver sendo usada em outra script
doPlayerAddItem(cid,11574,1)
doSendMagicEffect(getCreaturePosition(cid),2) -- numero do effect
return true
end
end