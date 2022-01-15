function onSay(cid, words, param)

local price = 50 -- preço em Golds!

for b = 1,5 do
if getPlayerBlessing(cid, b) then
doPlayerSendCancel(cid,'Voce ja esta de bless!')
else

if doPlayerRemoveMoney(cid, price*10000) == TRUE then
for i = 1,5 do
doPlayerAddBlessing(cid, i)
end

local pos = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
doSendMagicEffect(pos, 36)
doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Blessed!')
else
doPlayerSendCancel(cid, "Voce precisa de "..price.." golds para comprar bless!!")
end
end
end
return TRUE
end