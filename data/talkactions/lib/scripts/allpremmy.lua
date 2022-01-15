function onSay(cid, words, param, channel)
local t = string.explode(param, ",")

if not tonumber(t[1]) or tonumber(t[1]) <= 0 or (t[1] == "") then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
return true
end

for _, pid in ipairs(getPlayersOnline()) do
doPlayerAddPremiumDays(pid, t[1])
doPlayerSendTextMessage(pid, MESSAGE_INFO_DESCR, "Todos os player online ganharao "..t[1].." "..(tonumber(t[1]) == 1 and  "dia" or "dias").." premium.")
end
return true
end