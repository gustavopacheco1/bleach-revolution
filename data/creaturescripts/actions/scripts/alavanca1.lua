-- Script Made By: Sonkis (Gabriel Lisboa)
-- Start Config --
local topos = {x=1006, y=399, z=7} -- Posição para onde o player será teleportado.
-- End Config --
 
function onUse(cid)
   if doTeleportThing(cid, topos) then
  doPlayerSendTextMessage(cid,20,"Desca o buraco upe, suba depois sigua em frente até a alavanca e puxe-a.") -- Mude o NAME para o nome do local que o player será teleportado.
 end
end