function onSay(cid, words, param) 

if param == "open" then

setGlobalStorageValue(1756,1)

if getTileItemById({x = 1019, y = 1027, z = 6}, 1387).uid <= 0 then
local createtpp = doCreateItem(1387, 1, {x = 1019, y = 1027, z = 6}) -- criar teleport que entra no castle
end
doItemSetAttribute(getTileItemById({x = 1019, y = 1027, z = 6}, 1387).uid, "aid", 41991)

doBroadcastMessage("O Castle começou e terá duração de 1 hora !",22)

addEvent(function()
if getTopCreature({x = 2168, y = 50, z = 6}).uid <= 0 then
doSummonCreature("Crystal Central",{x = 2044, y = 420, z = 7},false) -- criar crystal central
doTeleportThing(getTopCreature({x = 2044, y = 420, z = 7}).uid, {x = 2168, y = 50, z = 6}, false) --teleport para o lugar dele
end
if getTopCreature({x = 2112, y = 311, z = 7}).uid <= 0 then
doSummonCreature("Crystal West",{x = 2043, y = 420, z = 7},false)  -- criar crystal esquerda
doTeleportThing(getTopCreature({x = 2043, y = 420, z = 7}).uid, {x = 2112, y = 311, z = 7}, false) --teleport para o lugar dele
end
if getTopCreature({x = 2243, y = 312, z = 7}).uid <= 0 then
doSummonCreature("Crystal East",{x = 2045, y = 420, z = 7},false) -- criar crystal direita
doTeleportThing(getTopCreature({x = 2045, y = 420, z = 7}).uid, {x = 2243, y = 312, z = 7}, false) --teleport para o lugar dele
end
end, 1000)

return true





elseif param == "close" then


setGlobalStorageValue(1756,0)

doBroadcastMessage("O Castle terminou!",22)





for _, pid in ipairs(getPlayersOnline()) do
if isInArea(getPlayerPosition(pid), {x = 1982, y = 5, z = 7}, {x = 2351, y = 496, z = 7}) then --area à ser analisada
if getGlobalStorageValue(1755) ~= getPlayerGuildId(pid) then
doTeleportThing(pid, {x = 2202, y = 433, z = 6}, false) --teleport para começo do castle
doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE,"Você falhou em dominar.")
else
doPlayerSendTextMessage(pid,MESSAGE_STATUS_CONSOLE_BLUE,"Você está dominando o Castle.")
end
end
end

for _, pid in ipairs(getPlayersOnline()) do
if isInArea(getPlayerPosition(pid), {x = 1982, y = 5, z = 6}, {x = 2351, y = 496, z = 6}) then --area à ser analisada
if getGlobalStorageValue(1755) ~= getPlayerGuildId(pid) then
doTeleportThing(pid, {x = 2202, y = 433, z = 6}, false) --teleport para começo do castle
doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE,"Você falhou em dominar.")
else
doPlayerSendTextMessage(pid,MESSAGE_STATUS_CONSOLE_BLUE,"Você está dominando o Castle.")
end
end
end

for _, pid in ipairs(getPlayersOnline()) do
if isInArea(getPlayerPosition(pid), {x = 1982, y = 5, z = 5}, {x = 2351, y = 496, z = 5}) then --area à ser analisada
if getGlobalStorageValue(1755) ~= getPlayerGuildId(pid) then
doTeleportThing(pid, {x = 2202, y = 433, z = 6}, false) --teleport para começo do castle
doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE,"Você falhou em dominar.")
else
doPlayerSendTextMessage(pid,MESSAGE_STATUS_CONSOLE_BLUE,"Você está dominando o Castle.")
end
end
end





if getTileItemById({x = 2164, y = 273, z = 7}, 1387).uid >= 1 then --remover teleport esquerda
doRemoveItem(getTileItemById({x = 2164, y = 273, z = 7}, 1387).uid, 1)
end

if getTileItemById({x = 2165, y = 273, z = 7}, 1387).uid >= 1 then --remover teleport direita
doRemoveItem(getTileItemById({x = 2165, y = 273, z = 7}, 1387).uid, 1)
end

if getTileItemById({x = 1019, y = 1027, z = 6}, 1387).uid >= 1 then --remover teleport que entra no castle
doRemoveItem(getTileItemById({x = 1019, y = 1027, z = 6}, 1387).uid, 1)
end





Port1 = getTopCreature({x = 2168, y = 50, z = 6})
if Port1.uid >= 1 then
doRemoveCreature(Port1.uid)
end

Port2 = getTopCreature({x = 2112, y = 311, z = 7})
if Port2.uid >= 1 then
doRemoveCreature(Port2.uid)
end

Port3 = getTopCreature({x = 2243, y = 312, z = 7})
if Port3.uid >= 1 then
doRemoveCreature(Port3.uid)
end


else





return doPlayerSendCancel(cid,"Fale /castle open[para abrir] ou /castle close[para fechar]")
end


return true
end 