function onStepIn(cid, item, pos)

local parameters = {cid=cid}

local config = {
[34] = 1369, -- sasor
[33] = 1369,
[32] = 1369,
[31] = 1369,
[30] = 1369,
[29] = 1369,
[28] = 1369,
[27] = 1393,
[26] = 1392,
[25] = 1369,
[24] = 1389,
[23] = 1396,
[22] = 1402,
[21] = 1369,
[20] = 1369,
[19] = 1400,
[18] = 1369,
[17] = 1383,
[16] = 1369,
[15] = 1369,
[14] = 1369,
[13] = 1390,
[12] = 1377,
[11] = 1376,
[10] = 1378,
[9] = 1379,
[8] = 1382,
[7] = 1371,
[6] = 1375,
[5] = 1373,
[4] = 1374,
[3] = 1373,
[2] = 1370,
[1] = 1369,

tempo = 1,

}

if isMonster(cid) then
return true
end

if item.actionid == 2021 then
doSetCreatureOutfit (cid, {lookType = config[getPlayerVocation(cid)]})
doSendAnimatedText(getPlayerPosition(cid),"Mergulho", math.random(1,69))
addEvent(Sparzinho, 1)
end
return true
end

function onStepOut(cid, item, pos)
doRemoveCondition(cid, CONDITION_OUTFIT)
doCreatureSetSkullType(cid, 0)
stopEvent(Sparzinho)
return true
end

function Sparzinho(parameters)
doCreatureExecuteTalkAction(cid, "!rest", TRUE)
doCreatureExecuteTalkAction(cid, "!down", TRUE)
doSendMagicEffect(getCreaturePosition(cid), 210)
end