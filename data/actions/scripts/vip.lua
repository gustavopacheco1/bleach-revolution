function onUse(cid, item, frompos, item2, topos)
local dias = 7 -- quantos dias de premium ganhara

doPlayerAddPremiumDays(cid, dias)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ganhou "..dias.." dias de premium account.")
local pos = {x=getPlayerPosition(cid).x+0, y=getPlayerPosition(cid).y+0, z=getPlayerPosition(cid).z}
doSendMagicEffect(pos, 1)
doRemoveItem(item.uid, 1)
return TRUE
end