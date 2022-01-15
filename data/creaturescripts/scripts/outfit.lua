local config = {
-- Naruto [1]
[1] = 71,

-- Sasuke [2]
[2] = 2,

-- Sakura [3]
[3] = 175,

-- Kakashi [4]
[4] = 11,

-- Rock Lee [5]
[5] = 60,

-- Neji [6] -- Terminar
[6] = 646,

-- TenTen [7]
[7] = 384,

-- Might Guy [8] -- Terminar
[8] = 646,

-- Kiba [9]
[9] = 69,

-- Hinata [10]
[10] = 295,

-- Shino [11] -- Terminar
[11] = 646,

-- Kurenai [12] -- Terminar
[12] = 646,

-- Shikamaru [13]
[13] = 340,

-- Ino [14] -- Terminar
[14] = 646,

-- Chouji [15]
[15] = 214,

-- Asuma [16] -- Terminar
[16] = 646,

-- Gaara [17]
[17] = 67,

-- Kankuro [18]
[18] = 309,

-- Temari [19] -- Terminar
[19] = 646,

-- Baki [20] -- Terminar
[20] = 646,

-- Deidara [21]
[21] = 660,

-- Itachi [22]
[22] = 96,

-- Kisame [23] -- Terminar
[23] = 646,

-- Hidan [24]
[24] = 350,

-- Tobi (Obito) [25]
[25] = 665,

-- Konan [26]
[26] = 820,

-- Sasori [27]
[27] = 646,

-- Kakuzu [28]
[28] = 646,

-- Zetsu [29] -- Terminar
[29] = 646,

-- Pain [30] -- Terminar
[30] = 646,

-- Hashirama [31]
[31] = 725,

-- Tobirama [32]
[32] = 593,

-- Sarutobi [33] -- Terminar
[33] = 646,

-- Minato [34]
[34] = 426,

-- Tsunade [35] -- Terminar
[35] = 646,

-- Jiraya [36]
[36] = 683,

-- Shisui [37]
[37] = 865,
}

function onLogin(cid)
local storage = 201209081902
if getPlayerStorageValue(cid, storage) < 1 and getPlayerStorageValue(cid, storage) ~= getPlayerVocation(cid) then
doCreatureChangeOutfit(cid, {lookType = config[getPlayerVocation(cid)]})
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Olá "..getPlayerName(cid)..", bem-vindo ao NTOUnLiMiTeD. Chame seus amigos para embarcar nessa aventura, compartilhe no facebook e concorra a premios. Bom jogo e boa sorte!")
setPlayerStorageValue(cid, storage, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Seja bem vindo, bom jogo e boa sorte!")
doCreatureSay(cid, "l NTOUnLiMiTeD l", TALKTYPE_MONSTER)
doSendMagicEffect(getThingPos(cid), 219)
end
return true
end