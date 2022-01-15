function onCombat(cid, target)
if isPlayer(target) == TRUE then 
if ((isInParty(target) and isInParty(cid)) and (getPlayerParty(cid) == getPlayerParty(target))) then
if(getConfigValue("noDamageToPartyMembers")) then
return false
end
end
end
return true
end