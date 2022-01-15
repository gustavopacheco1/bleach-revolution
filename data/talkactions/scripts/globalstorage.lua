function onSay(cid, words, param, channel)

if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
return true
end

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, ""..getGlobalStorageValue(param).."")

return true
end