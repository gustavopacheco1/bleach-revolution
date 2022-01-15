local config = {
--[vocation id] = { level, nova voc, looktype, efeito}
[1] = { 25, 66, 208},
[1] = { 50, 91, 208},
[1] = { 75, 18, 208},
[1] = { 100, 31, 208},
[1] = { 125, 92, 208},
[1] = { 150, 40, 208},
[1] = { 175, 305, 208},
[1] = { 200, 320, 208},
[1] = { 225, 179, 208},
[1] = { 250, 394, 208},
[1] = { 275, 397, 208},
[10] = { 25, 93, 108},
[10] = { 50, 6, 108},
[10] = { 75, 5, 108},
[10] = { 100, 306, 108},
[10] = { 125, 7, 108},
[10] = { 150, 94, 108},
[10] = { 175, 59, 108},
[10] = { 200, 8, 108},
[10] = { 225, 178, 110},
[10] = { 250, 95, 110},
[10] = { 275, 54, 110},
[30] = { 25, 80, 87},
[30] = { 50, 190, 87},
[30] = { 75, 83, 87},
[30] = { 100, 191, 87},
[30] = { 150, 192, 87},
[30] = { 175, 193, 87},
[30] = { 225, 392, 87},
[30] = { 250, 330, 87},
[40] = { 25, 194, 5},
[40] = { 50, 175, 5},
[40] = { 75, 169, 5},
[40] = { 100, 173, 5},
[40] = { 150, 172, 5},
[40] = { 175, 171, 5},
[40] = { 225, 174, 5},
[40] = { 250, 170, 5},
[50] = { 25, 67, 205},
[50] = { 50, 72, 205},
[50] = { 100, 65, 205},
[50] = { 125, 329, 205},
[50] = { 150, 188, 205},
[50] = { 175, 62, 205},
[50] = { 200, 189, 205},
[50] = { 225, 335, 205},
[50] = { 250, 57, 205},
[60] = { 25, 102, 124},
[60] = { 50, 103, 124},
[60] = { 75, 105, 124},
[60] = { 100, 107, 124},
[60] = { 150, 108, 124},
[60] = { 175, 314, 124},
[60] = { 225, 315, 124},
[60] = { 250, 333, 124},
[70] = { 25, 331, 209},
[70] = { 50, 69, 209},
[70] = { 75, 70, 209},
[70] = { 100, 199, 209},
[70] = { 150, 196, 209},
[70] = { 175, 197, 209},
[70] = { 225, 198, 209},
[70] = { 250, 332, 209},
[80] = { 25, 88, 187},
[80] = { 75, 341, 187},
[80] = { 100, 343, 187},
[80] = { 150, 342, 187},
[80] = { 200, 344, 187},
[80] = { 250, 345, 187},
[90] = { 25, 296, 124},
[90] = { 75, 297, 124},
[90] = { 150, 298, 124},
[90] = { 200, 299, 124},
[90] = { 250, 300, 124},
[100] = { 25, 384, 126},
[100] = { 75, 385, 126},
[100] = { 150, 386, 126},
[100] = { 200, 396, 126},
[110] = { 25, 97, 108},
[110] = { 50, 285, 108},
[110] = { 75, 282, 108},
[110] = { 100, 98, 108},
[110] = { 125, 284, 109},
[110] = { 150, 99, 109},
[110] = { 200, 283, 109},
[120] = { 25, 373, 4},
[120] = { 75, 374, 4},
[120] = { 125, 375, 4},
[120] = { 150, 376, 4},
[120] = { 200, 318, 4},
[120] = { 250, 377, 4},
[130] = { 25, 11, 10},
[130] = { 50, 287, 10},
[130] = { 75, 12, 10},
[130] = { 125, 10, 10},
[130] = { 150, 289, 10},
[130] = { 175, 288, 10},
[130] = { 200, 13, 10},
[130] = { 250, 14, 10}
}
function onSay(cid, words, param, channel)
local waittime = 2 -- Tempo de exhaustion
local storage = 5811

if exhaustion.check(cid, storage) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
return false
end
local from,to = {x=1001, y=705, z=7},{x=1031, y=737, z=7} -- começo e final do mapa
local from2,to2 = {x=1011, y=705, z=6},{x=1031, y=738, z=6} -- começo e final do mapa
local from3,to3 = {x=1012, y=706, z=5},{x=1032, y=739, z=5} -- começo e final do mapa
local from4,to4 = {x=985, y=598, z=7},{x=1044, y=652, z=7} -- começo e final do mapa
local from5,to5 = {x=986, y=615, z=6},{x=1039, y=647, z=7} -- começo e final do mapa
local from6,to6 = {x=990, y=616, z=5},{x=1040, y=647, z=5} -- começo e final do mapa
if isInRange(getCreaturePosition(cid), from, to) or isInRange(getCreaturePosition(cid), from2, to2) or isInRange(getCreaturePosition(cid), from3, to3) or isInRange(getCreaturePosition(cid), from4, to4) or isInRange(getCreaturePosition(cid), from5, to5) or isInRange(getCreaturePosition(cid), from6, to6) then
doPlayerSendCancel(cid, "Você não pode se Transformar nesta área!") return true
end
doPlayerSay(cid, "transformar")
local voc = config[getPlayerVocation(cid)]
if voc then
if getPlayerLevel(cid) >= voc[1] then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você Transformou!")
local outfit = {lookType = voc[2]}
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), voc[3])
exhaustion.set(cid, storage, waittime)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você precisa estar no level " .. voc[1] .. " para transformar.")
end
else
doPlayerSendCancel(cid, "Você não pode se Transformar!")
end
return true
end