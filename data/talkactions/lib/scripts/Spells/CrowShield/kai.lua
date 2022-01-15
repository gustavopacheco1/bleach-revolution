function onSay(cid, words, param, channel)
if #getCreatureSummons(cid) < 1 then
doRemoveCreature(uid)
doSendMagicEffect(getCreaturePosition(cid), 210)
return FALSE
end

for _, uid in pairs (getCreatureSummons(cid)) do
doRemoveCreature(uid)
doSendMagicEffect(getCreaturePosition(cid), 210)
end  
return TRUE
end