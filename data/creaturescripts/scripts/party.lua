function onCombat(cid, target)

if (not isPlayer(target)) then 
return true 
end

if(not isPlayer(cid)) then
return true
end

if (not isInParty(cid)) then
return true
end

if getPlayerParty(cid) == getPlayerParty(target) then
return doPlayerSendCancel(cid, 'You cannot attack teammate.') and false
end

return true

end  