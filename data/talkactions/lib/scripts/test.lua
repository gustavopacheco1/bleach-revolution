function onSay(cid, words, param)
        
if getPlayerGUIDByName(param) ~= nil then
doPlayerSendTextMessage(cid, 27, "SIM")
else
doPlayerSendTextMessage(cid, 27, "NAO")
end
return TRUE
end