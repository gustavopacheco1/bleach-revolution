local config = {
-- sasori - -
[34] = {701},
--haruma--
[33] = {1259},
--hagoromo--
[32] = {1259},
--shin--
[31] = {1260},
--menma--
[30] = {1258},
--gai--
[29] = {1252},
--kaguya--
[28] = {1257},
--Hashirama--
[27] = {706},
--Madara--
[26] = {1232},
--Raikage--
[25] = {794},
--Minato--
[24] = {1231},
--Deidara--
[23] = {744},
--konan-
[22] = {742},
--kimimaro-
[21] = {862},
--shisui-
[20] = {1251},
--orochimaru-
[19] = {732},
--onoki
[18] = {702},
--Sai
[17] = {725},
--Suigetsu
[16] = {748},
--Hidan--DN
[15] = {572},
--Kankuro--DN
[14] = {730},
--Killer bee--DN
[13] = {726},
--kakashi--DN
[12] = {743},
----Itachi----Dn
[11] = {704},
--Tenten---
[10] = {728},
--Hinata---
[9] = {1235},
--Shika---
[8] = {1238},
--Kiba---
[7] = {1234},
--Neji---
[6] = {1244},
--Gaara---
[5] = {1237},
--Sakura---
[4] = {724},
--Lee---
[3] = {1239},
--Sasuke---
[2] = {1243},
--Naruto---
[1] = {1230},
}


function onSay(cid, words, param, channel)


if exhaustion.check(cid, 120) == TRUE then
doPlayerSendCancel(cid, "Voce ja esta usando a roupa da Akatsuki.")
doSendMagicEffect(getCreaturePosition(cid), 134)
return TRUE
end

local from1,to1 = {x=1475, y=856, z=7},{x=1484, y=867, z=7} -- trocar vocation
local from2,to2 = {x=984, y=578, z=7},{x=1044, y=652, z=7} -- shinobi war
local from3,to3 = {x=984, y=578, z=6},{x=1044, y=652, z=6} -- shinobi war
local from4,to4 = {x=984, y=578, z=5},{x=1044, y=652, z=5} -- shinobi war

if not(getPlayerVocation(cid) >= 0 and getPlayerVocation(cid) <= 1) and getPlayerStorageValue(cid, 550000) < 1 then
doPlayerSendCancel(cid, "Voce Precisa Ser Da Akatsuki para Vestir-se!")
return FALSE
end

if isInRange(getCreaturePosition(cid), from1, to1) or isInRange(getCreaturePosition(cid), from2, to2) or isInRange(getCreaturePosition(cid), from3, to3) or isInRange(getCreaturePosition(cid), from4, to4) then
doPlayerSendCancel(cid, "Voce nao pode se Transformar nesta area!")
return TRUE
end

local voc = config[getPlayerVocation(cid)]

if voc then
if getPlayerLevel(cid) >= voc[1] then
doCreatureSay(cid, "Hail Akatsuki!", TALKTYPE_MONSTER)
doPlayerSetVocation(cid, voc[2])
local outfit = {lookType = voc[3]}
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), voc[4])
setPlayerStorageValue(cid, 300, (getPlayerVocation(cid)))
exhaustion.set(cid, 120, 1.0)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce precisa estar no level " .. voc[1] .. " para transformar.")
end
else
doPlayerSendCancel(cid, "Voce ja esta usando a roupa da Akatsuki.!")
end
return true
end