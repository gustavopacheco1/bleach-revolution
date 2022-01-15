local accepted_ip_list = {"127.0.0.1"} -- Lista dos players permitidos a usar MC, exemplo: {"200.85.3.60", "201.36.5.222"}

local event_message =
[[Os eventos ocorrem nos seguintes horários:
9 hrs Zombie Event, 10 hrs CTF Event e 11 hrs WAR Event;
14 hrs Zombie Event, 15 hrs CTF EVent e 16 hrs WAR Event;
19 hrs Zombie Event, 20 hrs CTF Event e 21 hrs WAR Event.]]

function onSay(cid, words, param, channel)

if isInArea(getPlayerPosition(cid), {x = 1008, y = 1514, z = 7}, {x = 1041, y = 1530, z = 7}) then
doPlayerSendCancel(cid, "Você já está na área de EVENTS.")
return true
end

for _, pid in ipairs(getPlayersOnline()) do
if isInArea(getPlayerPosition(pid), {x = 1008, y = 1514, z = 7}, {x = 1041, y = 1530, z = 7}) then
if getPlayerGroupId(cid) <= 3 then
if isInArray(accepted_ip_list,doConvertIntegerToIp(getPlayerIp(cid))) == false then
if getPlayerIp(cid) == getPlayerIp(pid) then
doPlayerSendCancel(cid, "Você não pode entrar com MC na área de EVENTS.")
return true
end
end
end
end
end

if getGlobalStorageValue(2000) == 1 or getGlobalStorageValue(2000) == 2 or getGlobalStorageValue(2000) == 10 then

if getTilePzInfo(getCreaturePosition(cid)) == true then

setPlayerStorageValue(cid, 217001, getCreaturePos(cid).x)
setPlayerStorageValue(cid, 217002, getCreaturePos(cid).y)
setPlayerStorageValue(cid, 217003, getCreaturePos(cid).z)
setPlayerStorageValue(cid, 497587, 0) -- teams event

doTeleportThing(cid, {x = math.random(1023, 1025), y = math.random(1520, 1522), z = 7})

else

doPlayerSendCancel(cid, "Você precisa estar na protection zone para entrar no evento.")

end

else

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, ""..event_message.."")

end



return true
end