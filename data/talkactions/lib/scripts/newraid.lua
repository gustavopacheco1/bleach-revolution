function onSay(cid, words, param)
	if getPlayerStorageValue(cid, 157158) < 1 then
	doPlayerSendCancel(cid, "Desculpe, apenas administradores com acesso, pode utilizar este comando.")
	return true
	end

local t = string.explode(param, ",")

if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires a amount to raid.")
return true
end

if not tonumber(t[2]) or not tonumber(t[3]) or not tonumber(t[4]) or not tonumber(t[5]) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Check if placed correctly the amount and location.")
return true
end

if not tostring(t[1]) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "The first parameter is the name of the monster, place it correctly.")
return true
end

for i = 1, t[2] do
doCreateMonster(t[1], {x = t[3], y = t[4], z = t[5]})
end

doBroadcastMessage("A new invasion began, run to kill the "..t[2].." "..t[1].."'s!")
return true
end