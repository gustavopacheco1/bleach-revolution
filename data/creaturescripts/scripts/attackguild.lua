function onAttack(cid, target)

  if isPlayer(target) and getPlayerGuildId(cid) == getPlayerGuildId(target) then
     local storageId = 101
     
   if getPlayerStorageValue(cid, storageId) == 1 then
      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não pode atacar guild members.")
     doCreatureSetSkullType(cid, 0) 
	 return false
   elseif getPlayerStorageValue(target, storageId) == 1 then
      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não pode atacar e ser atacado guild members.")
      doCreatureSetSkullType(cid, 0) 
	  return false
   end
  end
  
return true
end
