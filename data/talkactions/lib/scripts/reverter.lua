function onSay(cid, words, param, channel)
if getPlayerLevel(cid) >= 0 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Não pode mais reverter, sua saga atual ja esta ativada!")
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Não pode mais reverter, sua saga atual ja esta ativada!")
end
return true
end