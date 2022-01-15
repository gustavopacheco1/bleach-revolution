function onSay(cid, words, param, channel)
doPlayerSave(cid)
doPlayerSendTextMessage(cid, 27, "Seus dados foram salvos.")
return TRUE
end
