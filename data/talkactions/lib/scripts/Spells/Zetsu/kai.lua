function onSay(cid, words, param, channel)
if #getCreatureSummons(cid) < 1 then
doRemoveCreature(uid)
return FALSE
end

for _, uid in pairs (getCreatureSummons(cid)) do
doRemoveCreature(uid)
end  
return TRUE
end