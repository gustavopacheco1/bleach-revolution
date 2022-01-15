-- Script Made By: Sonkis (Gabriel Lisboa)
-- Start Config --
local topos = {x=1005, y=348, z=7} -- Posição para onde o player será teleportado.
-- End Config --
 
function onUse(cid)
   if doTeleportThing(cid, topos) then
  doPlayerSendTextMessage(cid,20,"Vá até o final da floresta mate o mizuki e pegue o pergaminho e entre no teleporte e entregue-o ao Sensei na escola.") -- Mude o NAME para o nome do local que o player será teleportado.
 end
end