local config = {
------- NARUTO -------
[1] = { 1, 1, 573, 2},
------- MINATO -------
[34] = { 1, 1, 573, 2},
}

local speed = 3000


function onSay(cid, words, param, channel)
	
if exhaustion.check(cid, 100) == TRUE then
doPlayerSendCancel(cid, "Espere, para subir no Kuchyose novamente.")
doSendMagicEffect(getCreaturePosition(cid), 134)
doChangeSpeed(cid, speed)
return TRUE
end

if #getCreatureSummons(cid) < 1 then
doPlayerSendCancel(cid, "Voce nao pode utilizar o comando, sem invoncar, um summon, ou esta ja em cima do mesmo.")
doChangeSpeed(cid, getCreatureSpeed(cid)+speed)
return FALSE
end

for _, uid in pairs (getCreatureSummons(cid)) do
doSendMagicEffect(getThingPosition(uid), 54)
doRemoveCreature(uid)
end  

local from1,to1 = {x=1475, y=856, z=7},{x=1484, y=867, z=7}
local from2,to2 = {x=984, y=578, z=7},{x=1044, y=652, z=7} 
local from3,to3 = {x=984, y=578, z=6},{x=1044, y=652, z=6}
local from4,to4 = {x=984, y=578, z=5},{x=1044, y=652, z=5}

if isInRange(getCreaturePosition(cid), from1, to1) or isInRange(getCreaturePosition(cid), from2, to2) or isInRange(getCreaturePosition(cid), from3, to3) or isInRange(getCreaturePosition(cid), from4, to4) then
doPlayerSendCancel(cid, "Voce nao pode fazer um Kuchyose nesta area!")
return TRUE
end

local voc = config[getPlayerVocation(cid)]

if voc then
if getPlayerLevel(cid) >= voc[1] then
doCreatureSay(cid, "Summon Rider! Up", TALKTYPE_MONSTER)
doPlayerSetVocation(cid, voc[2])
local outfit = {lookType = voc[3]}
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), voc[4])
doRemoveCreature(uid)
doChangeSpeed(cid, 30000)
doSendAnimatedText(getPlayerPosition(cid),"- UP -", math.random(1,69))
setPlayerStorageValue(cid, 300, (getPlayerVocation(cid)))
setPlayerStorageValue(cid, 19896, 1)
setPlayerStorageValue(cid, 171994, -1)
setPlayerStorageValue(cid, 107637, -1)
setPlayerStorageValue(cid, 107651, -1)
getPlayerStorageValue(cid, 3123)
exhaustion.set(cid, 120, 2.5)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce precisa estar no level " .. voc[1] .. " para utilizar o Rider.")
end
else
doPlayerSendCancel(cid, "Voce ja utilizou o Kuchyose.!")
end
return true
end