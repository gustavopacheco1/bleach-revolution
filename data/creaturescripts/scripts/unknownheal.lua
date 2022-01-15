function onStatsChange(cid, attacker, type, combat, value)
 
  if type == STATSCHANGE_HEALTHLOSS then
 
  local vida = (value) -- não mecha nisso
  local retira = 1 -- 1 vai absorve o life todo , 2 vai obsorve metade do life
 
   if (getPlayerStorageValue(cid, 54654644) == 1) then  
    doCreatureAddHealth(cid, (vida / retira))
    doSendAnimatedText(getCreaturePosition(cid), "+"..(vida / retira).."!", 25)
    return false
   end
 end
return true
end
 
function onLogin(cid)
doPlayerSetStorageValue(cid, 54654644, -1)
return true
end