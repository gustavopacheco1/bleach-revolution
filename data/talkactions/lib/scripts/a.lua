local config = {
-- Danzou - -
[50] = {1, 50, 1367, 2},
-- sasori - -
[34] = {1, 34, 701, 2},
--haruma--
[33] = {1, 33, 1259, 2},
--hagoromo--
[32] = {1, 32, 1259, 2},
--shin--
[31] = {1, 31, 1260, 2},
--menma--
[30] = {1, 30, 1258, 2},
--gai--
[29] = {1, 29, 1252, 2},
--kaguya--
[28] = {1, 28, 1257, 2},
--Hashirama--
[27] = {1, 27, 706, 2},
--Madara--
[26] = {1, 26, 1232, 2},
--Raikage--
[25] = {1, 25, 794, 2},
--Minato--
[24] = {1, 24, 1231, 2},
--Deidara--
[23] = {1, 23, 744, 2},
--konan-
[22] = {1, 22, 742, 2},
--kimimaro-
[21] = {1, 21, 862, 2},
--shisui-
[20] = {1, 20, 1354, 2},
--orochimaru-
[19] = {1, 19, 732, 2},
--onoki
[18] = {1, 18, 702, 2},
--Sai
[17] = {1, 17, 725, 2},
--Suigetsu
[16] = {1, 16, 748, 2},
--Hidan--DN
[15] = {1, 15, 572, 2},
--Kankuro--DN
[14] = {1, 14, 730, 2},
--Killer bee--DN
[13] = {1, 13, 726, 2},
--kakashi--DN
[12] = {1, 12, 743, 2},
----Itachi----Dn
[11] = {1, 11, 704, 2},
--Tenten---
[10] = {1, 10, 728, 2},
--Hinata---
[9] = {1, 9, 1235, 2},
--Shika---
[8] = {1, 8, 1238, 2},
--Kiba---
[7] = {1, 7, 1234, 2},
--Neji---
[6] = {1, 6, 1244, 2},
--Gaara---
[5] = {1, 5, 1237, 2},
--Sakura---
[4] = {1, 4, 724, 2},
--Lee---
[3] = {1, 3, 1239, 2},
--Sasuke---
[2] = {1, 2, 1243, 2},
--Naruto---
[1] = {1, 1, 1230, 2},
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