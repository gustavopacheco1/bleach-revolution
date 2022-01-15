local items = {11466, 11519, 11409}
local chancenada = 100

function onUse(cid, item)

if (getPlayerPremiumDays(cid) < 0) then
doPlayerSendCancel(cid, "Nao pode usar se nao for premium account.")
return true
end

if math.random(100, 100) <= chancenada then
doPlayerSendCancel(cid, "Nao veio nada.")
doRemoveItem(item.uid, 1)
return true
end

doPlayerAddItem(cid, items[math.random(1, #items)], 1)
doRemoveItem(item.uid, 1)
return true
end