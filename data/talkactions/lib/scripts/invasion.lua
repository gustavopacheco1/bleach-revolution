function onSay(cid, words, param, channel) 

local pos = {x=1023, y=917, z=7} -- position onde ele vai aparecer
local mob = "event boss" -- nome do monstro
local time = 2 -- minutos para o monstro aparecer

local function Sumon()
doCreateMonster(""..mob.."", pos)
setWorldType(WORLD_TYPE_NO_PVP)
doBroadcastMessage("O "..mob.." finalmente chegou a konoha! rapido defendem a cidade!", MESSAGE_EVENT_ADVANCE)
doBroadcastMessage("Gameworld type set to: No-PVP.", MESSAGE_EVENT_ADVANCE)
end

if (param == "") then
doPlayerSendTextMessage(cid, 27, "Digite o nome do monstro.")
return TRUE
end

if not (param == ""..mob.."") then
doPlayerSendTextMessage(cid, 27, "Essa invasao nao existe.")
else
doBroadcastMessage("[EVENTO AUTOMATICO] Preparem-se! um "..mob.." vem em direçao a konoha!", MESSAGE_EVENT_ADVANCE)
addEvent(Sumon, time*60*1000)
end
return TRUE
end