local waittime = 30 --Default (30 seconds)
local storage = 5560

function onSay(cid, words, param, channel)
if exhaustion.get(cid, storage) == FALSE then
doPlayerSave(cid)
exhaustion.set(cid, storage, waittime)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu personagem foi salvo com sucesso.")
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You must wait another " .. exhaustion.get(cid, storage) .. " seconds.")
end
return TRUE
end