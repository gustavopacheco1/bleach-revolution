function onTarget(cid, target)
local item_id = 12685
if getPlayerItemCount(cid,item_id) >= 1 then
doSendAnimatedText(getCreaturePos(attacker), "DANO!", 144)
doSendAnimatedText(getCreaturePos(target), "DANO!", 144)
else
doPlayerSendCancel(cid, "Desculpe, para passar voce, necessita adquirir o acesso com o NPC Tyron.")
end
return true
end
