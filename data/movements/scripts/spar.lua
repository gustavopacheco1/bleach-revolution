function onStepIn(cid, item, position, fromPosition)
local item_id = 12701
if getPlayerItemCount(cid,item_id) >= 1 then
else
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getCreaturePos(cid), 2)
doPlayerSendCancel(cid, "Desculpe, para passar voce, necessita adquirir o acesso com o NPC Tyron.")
end
return true
end