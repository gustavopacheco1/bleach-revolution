local dodge = {storage = xxx, percent = xxx}
local critical = {storage = xxx, percent = xxx}
function onStatsChange(cid, attacker, combat, type, value)
   
if isCreature(cid) and isCreature(attacker) then
    
if type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS and cid ~= attacker then
        
if getPlayerStorageValue(cid, dodge.storage) >= math.random(1,1000) then
            
doTargetCombatHealth(attacker, cid, combat, -value*dodge.percent, - value*dodge.percent, 255)
doSendMagicEffect(getCreaturePosition(cid), 2)
doSendAnimatedText(getCreaturePosition(cid), "DODGE!", math.random(1,255))
return false
            
elseif getPlayerStorageValue(attacker, critical.storage) >= math.random(1,1000) then
            
doTargetCombatHealth(attacker, cid, combat, -value*critical.percent, - value*critical.percent, 255)
doSendMagicEffect(getCreaturePosition(cid), 0)
doSendAnimatedText(getCreaturePosition(cid), "CRITICAL!", math.random(1,255))
return false
            
end
        
end
    
end
return true
end
            
function onLogin(cid)
    
registerCreatureEvent(cid, "dcs")
    
if getPlayerStorageValue(cid, dodge.storage) <= 0 then
setPlayerStorageValue(cid, dodge.storage, 0)
end
      
if getPlayerStorageValue(cid, critical.storage) <= 0 then
setPlayerStorageValue(cid, critical.storage, 0)
end
    
return true
end