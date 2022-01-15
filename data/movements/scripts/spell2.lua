local s = {5678,5679,5677}
voltar_para = {x=1249,y=726,z=6} -- se o player tentar sair, mas n tiver passado os 30 s, voltar para
function onStepIn(cid)
k = getPlayerStorageValue(cid, s[2]) - os.time()
if k <= 0 then
t = loadstring(getPlayerStorageValue(cid, s[1]))()
doTeleportThing(cid, t)
addEvent(doSendMagicEffect, 0, t, 10)
addEvent(doSendMagicEffect, 500, t, 10)
addEvent(doSendMagicEffect, 100, pos, 1)
setPlayerStorageValue(cid, s[3], -1)
else
doTeleportThing(cid, voltar_para)
doPlayerSendTextMessage(cid, 19, "Aguarde "..k.." segundos.")
end
return true
end