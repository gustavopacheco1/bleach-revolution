function onSay(cid, words, param)
local file = io.open('data/logs/Reports.txt','w+')
file:close()
doPlayerSendTextMessage(cid, 22, "Reports foram apagados com sucesso.")
return TRUE
end