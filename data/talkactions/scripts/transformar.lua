local config = {
--[vocation id] = { level, nova voc, looktype, efeito}
-- Ichigo
[1] = { 100, 2, 3},
[2] = { 150, 3, 4},
[3] = { 200, 4, 5},
[4] = { 300, 5, 6},
[5] = { 400, 6, 6},

-- Chad
[7] = { 100, 8, 157},
[8] = { 150, 9, 158},
[9] = { 200, 10, 159},
[10] = { 300, 11, 160},
[11] = { 400, 12, 161},

-- Bazz B
[13] = { 100, 14, 148},
[14] = { 150, 15, 149},
[15] = { 200, 16, 150},
[16] = { 300, 17, 151},
[17] = { 400, 18, 152},

-- Orihime
[19] = { 100, 20, 59},
[20] = { 150, 21, 60},
[21] = { 200, 22, 61},
[22] = { 300, 23, 62},
[23] = { 400, 24, 63},

-- Uryu
[25] = { 30, 26, 34},
[26] = { 50, 27, 35},
[27] = { 100, 28, 36},
[28] = { 200, 29, 37},
[29] = { 300, 30, 38},

-- Ulquiorra
[31] = { 50, 32, 113},
[32] = { 100, 33, 114},
[33] = { 200, 34, 115},
[34] = { 300, 35, 116},
[35] = { 400, 36, 117},

-- Zaraki
[37] = { 100, 38, 123},
[38] = { 150, 39, 124},
[39] = { 200, 40, 125},
[40] = { 300, 41, 126},
[41] = { 400, 42, 127},

-- Byakuya
[43] = { 100, 44, 85},
[44] = { 150, 45, 86},
[45] = { 200, 46, 87},
[46] = { 300, 47, 88},
[47] = { 400, 48, 89},

-- Toshiro
[49] = { 100, 50, 73},
[50] = { 150, 51, 74},
[51] = { 200, 52, 75},
[52] = { 300, 53, 76},
[53] = { 400, 54, 77},

-- Rukia
[55] = { 100, 56, 20},
[56] = { 150, 57, 21},
[57] = { 200, 58, 22},
[58] = { 300, 59, 23},
[59] = { 400, 60, 24},

-- Nelliel
[61] = { 100, 62, 97},
[62] = { 150, 63, 98},
[63] = { 200, 64, 99},
[64] = { 300, 65, 100},
[65] = { 400, 66, 101},

-- Unohana
[67] = { 100, 68, 139},
[68] = { 150, 69, 140},
[69] = { 200, 70, 141},
[70] = { 300, 71, 142},
[71] = { 400, 72, 143},

-- Renji
[73] = { 100, 74, 47},
[74] = { 150, 75, 48},
[75] = { 200, 76, 49},
[76] = { 300, 77, 50},
[77] = { 400, 78, 51}



















}
function onSay(cid, words, param, channel)
local voc = config[getPlayerVocation(cid)]
if voc then
if getPlayerLevel(cid) >= voc[1] then
doPlayerSetVocation(cid, voc[2])
doCreatureSay(cid, "Transformar", 19)
local outfit = {lookType = voc[3]}
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), voc[4])
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Voce precisa estar no level " .. voc[1] .. " para transformar.")
end
else
doPlayerSendCancel(cid, "Nao é possível se transformar.")
end
return true
end