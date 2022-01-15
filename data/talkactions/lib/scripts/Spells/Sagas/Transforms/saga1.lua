local storage = 171994
local config = {
--Obito - -
[57] = { 1, 1, 665, 2},
--Chouji - -
[56] = { 1, 1, 214, 2},
--Jiraya - -
[55] = { 1, 1, 683, 2},
--Konan - -
[54] = { 1, 1, 820, 2},
-- sasori - -
[34] = { 1, 1, 789, 2},
--gai--
[29] = { 1, 1, 931, 2},
--Tobirama--
[28] = { 1, 1, 593, 2},
--Hashirama--
[27] = { 1, 1, 725, 2},
--Madara--
[26] = { 1, 1, 524, 2},
--Raikage--
[25] = { 1, 1, 804, 2},
--Minato--
[24] = { 1, 1, 426, 2},
--Deidara--
[23] = { 1, 1, 668, 2},
--konan-
[22] = { 1, 1, 805, 2},
--kimimaro-
[21] = { 1, 1, 555, 2},
--shisui-
[20] = { 1, 1, 865, 2},
--orochimaru-
[19] = { 1, 1, 611, 2},
--Sai
[17] = { 1, 1, 462, 2},
--Hidan--DN
[15] = { 1, 1, 358, 2},
--Kankuro--DN
[14] = { 1, 1, 309, 2},
--Killer bee--DN
[13] = { 1, 1, 372, 2},
--kakashi--DN
[12] = { 1, 1, 11, 2},
----Itachi----Dn
[11] = { 1, 1, 96, 2},
--Tenten---
[10] = { 1, 1, 384, 2},
--Hinata---
[9] = { 1, 1, 295, 2},
--Shikamaru---
[8] = { 1, 1, 340, 2},
--Kiba---
[7] = { 1, 1, 69, 2},
--Neji---
[6] = { 1, 1, 101, 2},
--Gaara---
[5] = { 1, 1, 67, 2},
--Sakura---
[4] = { 1, 1, 175, 2},
--Lee---
[3] = { 1, 1, 60, 2},
--Sasuke---
[2] = { 1, 1, 2, 2},
--Naruto---
[1] = { 1, 1, 71, 2}
}
function onSay(cid, words, param, channel)

if getPlayerStorageValue(cid, storage) == -1 then
doPlayerSendCancel(cid, "Desculpe, você não pode, utilizar uma saga, estando em cima do Gamabunta.")
return false
end
	
if exhaustion.check(cid, 100) == TRUE then
doPlayerSendCancel(cid, "Espere 1 segundos para se transformar denovo.")
doSendMagicEffect(getCreaturePosition(cid), 134)
return TRUE
end

local from1,to1 = {x=1475, y=856, z=7},{x=1484, y=867, z=7} -- trocar vocation
local from2,to2 = {x=984, y=578, z=7},{x=1044, y=652, z=7} -- shinobi war
local from3,to3 = {x=984, y=578, z=6},{x=1044, y=652, z=6} -- shinobi war
local from4,to4 = {x=984, y=578, z=5},{x=1044, y=652, z=5} -- shinobi war

if isInRange(getCreaturePosition(cid), from1, to1) or isInRange(getCreaturePosition(cid), from2, to2) or isInRange(getCreaturePosition(cid), from3, to3) or isInRange(getCreaturePosition(cid), from4, to4) then
doPlayerSendCancel(cid, "Voce nao pode se Transformar nesta area!")
return TRUE
end

local voc = config[getPlayerVocation(cid)]

if voc then
if getPlayerLevel(cid) >= voc[1] then
doCreatureSay(cid, "Transformar!", TALKTYPE_MONSTER)
doPlayerSetVocation(cid, voc[2])
local outfit = {lookType = voc[3]}
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), voc[4])
doRemoveCreature(uid)
setPlayerStorageValue(cid, 300, (getPlayerVocation(cid)))
exhaustion.set(cid, 120, 2.5)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce precisa estar no level " .. voc[1] .. " para transformar.")
end
else
doPlayerSendCancel(cid, "Voce ja esta na ultima transformaçao.!")
end
if isPlayer(cid) == TRUE then
return true
end
return true
end