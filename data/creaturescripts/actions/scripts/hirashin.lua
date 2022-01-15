function onUse(cid, item, fromPosition, itemEx, toPosition)
     local stor = 5765432
     local segundos = 0
     local pos = fromPosition
     local aqui = getPlayerPosition(cid)
     local vocs = {1, 24}
     local agua = {4610, 4612, 4611, 4664, 4613, 4666, 4646, 4654, 4609, 4665, 4608, 4625, 4665, 4666, 4645}
     local parede = {1227, 1228, 1230, 1030, 1229, 1029, 1025, 1026, 1027, 1259, 1028, 1032, 1034, 1033, 1536, 1533, 873, 919, 874, 1037, 2700, 2708, 4472, 4475, 4471, 3388, 3373, 3363, 3398, 3408, 3417, 3420, 3407, 3368, 2701, 5130, 6170, 6166, 1596, 3361, 3362, 3363, 3364, 3365, 3366, 3367, 3368, 3369, 3370, 3371, 3372, 3373, 3374, 3375, 3376, 3377, 3378, 3379, 3380, 3381, 3382, 3383, 3384, 3385, 3386, 3387, 3388, 3389, 3390, 3391, 3392, 3393, 3394, 3395, 3396, 3397, 3398, 3399, 3400, 3401, 3402, 3403, 3404, 3405, 3406, 3407, 3408, 3409, 3410, 3411, 3412, 3413, 3414, 3415, 3416, 3417, 3418, 3419, 3420, 3421, 3422}
     local pedra = {874, 2705, 5096, 919, 873, 2707, 2784, 2778, 3330, 4471, 4475, 4473, 4472, 4474, 4468, 4478, 4469, 4470, 4479, 2703, 2704, 1534, 2739, 3867, 5324, 5316, 5315, 5317, 1600, 1597, 1601}
     if getDistanceBetween(aqui, toPosition) >= 8 then
         return doPlayerSendTextMessage(cid, 27, "Esta¡ muito longe.")
     elseif(not(isSightClear(aqui, toPosition, 1))) then
         return doPlayerSendTextMessage(cid, 27, "Isso é impossivel.")
     elseif(getTilePzInfo(aqui)) then
         return doPlayerSendCancel(cid, "Não pode usar a tecnica Deus Dragão em casas ou areas protegidas.(Não tente bugar, Ban perma)")
     elseif(getTilePzInfo(toPosition)) then
         return doPlayerSendCancel(cid, "Não pode usar a tecnica Deus Dragão em casas ou areas protegidas.(Não tente bugar, Ban perma)")
     elseif(isInArray(agua, itemEx.itemid)) then
         return doPlayerSendTextMessage(cid, 27, "voce nao pode usar em agua(Não tente bugar, Ban perma)")
     elseif(isInArray(parede, itemEx.itemid)) then
         return doPlayerSendTextMessage(cid, 27, "voce nao pode usar em paredes(Não tente bugar, Ban perma)")
     elseif(isInArray(pedra, itemEx.itemid)) then
         return doPlayerSendTextMessage(cid, 27, "voce nao pode usar em pedras(Não tente bugar, Ban perma)")
     elseif(not(isInArray(vocs, getPlayerVocation(cid)))) then
         return doPlayerSendTextMessage(cid, 27, "Apenas Minato e naruto podem usar esta tecnica.")
     elseif getPlayerStorageValue(cid, stor) - os.time() > 0 then
         return doPlayerSendTextMessage(cid, 27, "Aguarde 30 segundos para usar novamente.")
     end
     if (doTeleportThing(cid, toPosition, false)) then
         setPlayerStorageValue(cid, stor, os.time() + segundos)
         doSendMagicEffect(pos, 131)
         doSendMagicEffect(toPosition, 131)
         doSendDISTANCEEFFECT(toPosition, 15)
         doCreatureSay(cid, "Hirashin jutsu", 19)
     end
     
     return doPlayerSendCancel(cid, "Desculpe nao foi possivel.")
 end 