local config1 = {
------- NARUTO -------
[1] = { 1, 1, 429, 2},
------- MINATO -------
[34] = { 1, 1, 429, 2},
}

function onSay(cid, words, param, channel)

local from1,to1 = {x=1475, y=856, z=7},{x=1484, y=867, z=7}
local from2,to2 = {x=984, y=578, z=7},{x=1044, y=652, z=7} 
local from3,to3 = {x=984, y=578, z=6},{x=1044, y=652, z=6}
local from4,to4 = {x=984, y=578, z=5},{x=1044, y=652, z=5}

local storage = 19896

if getPlayerStorageValue(cid, storage) < 1 then
doPlayerSendCancel(cid, "Desculpe, voce precisa estar montado em um summon para descer.")
return true
end

if isInRange(getCreaturePosition(cid), from1, to1) or isInRange(getCreaturePosition(cid), from2, to2) or isInRange(getCreaturePosition(cid), from3, to3) or isInRange(getCreaturePosition(cid), from4, to4) then
doPlayerSendCancel(cid, "Voce nao pode fazer um Kuchyose nesta area!")
return TRUE
end

local ppos = getPlayerPosition(cid)
local voc = config1[getPlayerVocation(cid)]

if voc then
if getPlayerLevel(cid) >= voc[1] then
doCreatureSay(cid, "Summon Rider! Down", TALKTYPE_MONSTER)
doPlayerSetVocation(cid, voc[2])
local outfit = {lookType = voc[3]}
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), voc[4])
---------------------------------------------------
------ Local Tabela: Inicio --
	if isInArray({1,34}, getPlayerVocation(cid)) then
	doConvinceCreature(cid, doCreateMonster("Gamabunta", ppos))
	end
	if isInArray({21}, getPlayerVocation(cid)) then
	doConvinceCreature(cid, doCreateMonster("Karasu", ppos))
	end
------ Local Tabela: Fim    -- 
---------------------------------------------------
doSendAnimatedText(getPlayerPosition(cid),"- DOWN -", math.random(1,69))
setPlayerStorageValue(cid, 300, (getPlayerVocation(cid)))
setPlayerStorageValue(cid, 19896, -1)
setPlayerStorageValue(cid, 171994, 1)
setPlayerStorageValue(cid, 19898, -1)
setPlayerStorageValue(cid, 107647, -1)
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