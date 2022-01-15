--[[> Marcryzius <]]-- 
POSITIONS = {} 
function onSay(I,II,III) 
local positions,pos = '',getCreaturePosition(I) 
   if(II == '/sethome')then 
      if(III ~= '' and III ~= ' ' and #III > 2)then 
         POSITIONS[''..III..''] = {x=pos.x,y=pos.y,z=pos.z} 
         doPlayerSendTextMessage(I,20,'Este local foi salvo com o nome de '..III..'.') 
         doSendMagicEffect(pos, 2) 
      else 
         doPlayerSendTextMessage(I,20,'Par�metro invalido pra ser salvo ou o nome tem que ter no minimo 3 caracteres.') 
      end 
   elseif(II == '/home')then 
      if(POSITIONS[III])then 
         doTeleportThing(I,POSITIONS[III]) 
         doSendMagicEffect(POSITIONS[III], 2) 
         doSendMagicEffect(POSITIONS[III], 2) 
         doPlayerSendTextMessage(I,20,'Voce foi teleportado para '..III..'.') 
      else 
         doPlayerSendTextMessage(I,20,'Este local n�o foi salvo ou o nome est� incorreto.') 
         doSendMagicEffect(pos, 2) 
      end 
   elseif(II == '/delhome')then 
      if(POSITIONS[III])then 
         doPlayerSendTextMessage(I,20,'O local "'..III..'" foi removido.') 
         POSITIONS[III] = nil 
      else 
         doPlayerSendTextMessage(I,20,'Esse local n�o existe ou o nome est� incorreto.') 
         doSendMagicEffect(pos, 2) 
      end 
   elseif(II =='/homes')then 
      for k in pairs(POSITIONS) do 
         positions = positions..(positions == '' and ' ' or ', ')..k 
      end 
      if(#positions > 1)then 
         doPlayerSendTextMessage(I,20,'Essas s�o as posi��es salvas: '..positions..'.') 
      else 
         doPlayerSendTextMessage(I,20,'N�o existem locais salvos.') 
      end 
   end 
   return true 
end 