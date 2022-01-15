function onSay(cid, words, param)
if exhaustion.check(cid, 2123) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Precisa esperar para reportar novamente")
return false
end
if #param <= 10 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu report precisa ter pelo menos 10 caracters")
return false
end
local file = io.open("./report.txt", "a")
file:write("\n "..getPlayerName(cid).." "..os.date("%A").." as "..tostring(os.date("%X")):sub(1, 5).." reportou dizendo ("..param..")")
file:close()
setGlobalStorageValue(28212, getGlobalStorageValue(28212)+1)
exhaustion.set(cid, 2123, 36000)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu report foi enviada com sucesso logo sera atendindo obrigado pela colaboração")
for _, id in ipairs(getPlayersOnline()) do
if getPlayerGroupId(cid) > 5 then
doShowTextDialog(cid, 1952, ""..getPlayerName(cid).." acabou de reportar dizendo ("..param..") este report esta salvo no log")
exhaustion.set(cid, 2123, 36000)
return true
end
return true
end
end