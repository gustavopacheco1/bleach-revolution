function onUse(cid)
	local config = {
    premiumDays = 1,
    storageQuest = 2221,
    timeWait = 3, -- tempo em minutos
}
	
	parameters = {cid=cid}
	if (getPlayerStorageValue(parameters.cid, config.storageQuest) < os.time()) then
		setPlayerStorageValue(parameters.cid, config.storageQuest, os.time() + (config.timeWait * 1))
		else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você deve esperar "..config.timeWait.." segundos, para utilizar o finder novamente.")
		return true
	end
    if getCreatureByName("Ichibi") or getCreatureByName("Nibi") or getCreatureByName("Sanbi") or getCreatureByName("Yonbi") or getCreatureByName("Gobi") or getCreatureByName("Rokubi") or getCreatureByName("Shichibi") or getCreatureByName("Hachibi") or getCreatureByName("Kyuubi") then
	doCreatureExecuteTalkAction(parameters.cid, "!bijuu Ichibi", true)
	doCreatureExecuteTalkAction(parameters.cid, "!bijuu Nibi", true)
	doCreatureExecuteTalkAction(parameters.cid, "!bijuu Sanbi", true)
	doCreatureExecuteTalkAction(parameters.cid, "!bijuu Yonbi", true)
	doCreatureExecuteTalkAction(parameters.cid, "!bijuu Gobi", true)
	doCreatureExecuteTalkAction(parameters.cid, "!bijuu Rokubi", true)
	doCreatureExecuteTalkAction(parameters.cid, "!bijuu Shichibi", true)
	doCreatureExecuteTalkAction(parameters.cid, "!bijuu Hachibi", true)
	doCreatureExecuteTalkAction(parameters.cid, "!bijuu Kyuubi", true)
	else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Não há selos de bijuus quebrados.")
	return true
	end
end