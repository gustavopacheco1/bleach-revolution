function onStepIn(cid, item, pos)

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

tempo = 60,

}

if isMonster(cid) then
return true
end

if item.actionid == 2020 then
doSetCreatureOutfit (cid, {lookType = config[getPlayerVocation(cid)]})
doSendAnimatedText(getPlayerPosition(cid),"Mergulho", math.random(1,69))
addEvent(STAMINABYALEXY, config.tempo * 1000, cid)
end
return true
end

function STAMINABYALEXY(cid, pos)

        local enviar = {x = 988, y = 940, z = 7}
	local refuel = 42 * 60 * 1000

	if(getPlayerStamina(cid) >= refuel) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "stamina cheia, você foi retirado do mergulho.")
                doTeleportThing(cid, enviar)
	else
		doPlayerSetStamina(cid, refuel)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você já está com stamina cheia, vaza!.")
                doTeleportThing(cid, enviar)
	end
	return true
end

function onStepOut(cid, item, pos)
doRemoveCondition(cid, CONDITION_OUTFIT)
doCreatureSetSkullType(cid, 0)
doSendAnimatedText(getPlayerPosition(cid),"Saiu!", math.random(1,69))
stopEvent(STAMINABYALEXY)
return true
end