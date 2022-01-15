function onUse(cid)
	parameters = {cid=cid}
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