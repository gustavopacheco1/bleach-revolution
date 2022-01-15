local saga = {

-- Naruto [1]
[1] = {71, 66, 18, 31, 40, 49, 442, 320, 494, 986, 439}

-- Sasuke [2]
[2] = {2, 93, 6, 5, 7, 94, 59, 8, 178, 95, 450, 165, 409},

-- Sakura [3]
[3] = {175, 173, 174, 169, 184, 172, 171, 185, 170, 407, 408},

-- Kakashi [4]
[4] = {11, 287, 12, 289, 10, 13, 446, 13, 14, 434, 436},

-- Rock Lee [5]
[5] = {60, 60, 191, 80, 190, 192, 82, 193, 229, 281},

-- Neji [6] -- Terminar
[6] = 646,

-- TenTen [7]
[7] = {384, 385, 386, 468, 469, 470, 471, 472},

-- Might Guy [8] -- Terminar
[8] = 646,

-- Kiba [9]
[9] = {69, 70, 84, 196, 197, 396, 198, 199, 200},

-- Hinata [10]
[10] = {295, 296, 296, 297, 297, 395, 299, 298, 394, 319},

-- Shino [11] -- Terminar
[11] = 646,

-- Kurenai [12] -- Terminar
[12] = 646,

-- Shikamaru [13]
[13] = {340, 341, 341, 342, 342, 344, 344, 343, 345, 345, 324, 85},

-- Ino [14] -- Terminar
[14] = 646,

-- Chouji [15]
[15] = {214, 214, 215, 215, 216, 217, 218, 227, 566, 565},

-- Asuma [16] -- Terminar
[16] = 646,

-- Gaara [17]
[17] = {67, 72, 273, 62, 189, 65, 188, 58, 187, 449, 451},

-- Kankuro [18]
[18] = {309, 312, 312, 309, 310, 313, 313, 392, 405},

-- Temari [19] -- Terminar
[19] = 646,

-- Baki [20] -- Terminar
[20] = 646,

-- Deidara [21]
[21] = {668, 669, 669, 670, 670, 671, 672, 673, 674, 675, 676},

-- Itachi [22]
[22] = {96, 98, 99, 100, 186, 283, 284, 282, 285, 531},

-- Kisame [23] -- Terminar
[23] = 646,

-- Hidan [24]
[24] = {358, 361, 361, 360, 360, 365, 212, 401},

-- Tobi (Obito) [25]
[25] = {665, 665, 659, 678, 658, 720, 721, 722, 723, 724},

-- Konan [26]
[26] = {805, 806, 809, 810, 811, 812, 813, 814, 815},

-- Sasori [27]
[27] = {789, 790, 791, 792, 793, 794, 795, 796, 797, 798, 799, 800, 801, 802},

-- Kakuzu [28] -- Terminar
[28] = 646,

-- Zetsu [29] -- Terminar
[29] = 646,

-- Pain [30] -- Terminar
[30] = 646,

-- Hashirama [31]
[31] = {725, 726, 727, 728, 729, 730, 731, 732, 984},

-- Tobirama [32]
[32] = {593, 594, 594, 595, 864, 596},

-- Sarutobi [33] -- Terminar
[33] = 646,

-- Minato [34]
[34] = {426, 427, 428, 429, 430, 430, 431, 432},

-- Tsunade [35] -- Terminar
[35] = 646,

-- Jiraya [36]
[36] = {683, 684, 686, 687, 688, 690, 691, 692, 693, 694},

-- Shisui [37]
[37] = {865, 866, 867, 868, 869, 870, 871, 872, 873, 874, 875, 876}
}

local level = 25 -- Limite para liberar uma saga nova

function onSay(cid, words, param, channel)

if exhaustion.check(cid, 120) == TRUE then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return TRUE
end


 if(param == '') then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite o número da saga que você deseja.")
 exhaustion.set(cid, 120, 0.5) 
 return true
 end


if not saga[getPlayerVocation(cid)] then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode trocar de saga.")
exhaustion.set(cid, 120, 0.5)
return true
end


local t = string.explode(param, ",")


 if(t[2]) then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Could not understand.")
  return true
 end


 if not (tonumber(t[1])) then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite o número da saga que você deseja.")
 exhaustion.set(cid, 120, 0.5) 
 return true
 end


if tonumber(t[1]) > #saga[getPlayerVocation(cid)] or tonumber(t[1]) < 1  then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa saga não existe.")
exhaustion.set(cid, 120, 0.5)
return true
end




if getPlayerLevel(cid) >= (tonumber(t[1])*level) then
doSetCreatureOutfit(cid, {lookType = saga[getPlayerVocation(cid)][tonumber(t[1])]}, -1)
doSendMagicEffect(getThingPos(cid), saga[getPlayerVocation(cid)].effect)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce escolheu uma nova saga!")
doPlayerSay(cid, "Saga!!", TALKTYPE_ORANGE_1)
exhaustion.set(cid, 120, 0.5)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Desculpe, você precisa de level "..(tonumber(t[1]) * level).." usar essa saga.")
end


return true
end