function onStepIn(cid, item, position, fromPosition)
	if getCreatureStorage(cid, "reishi_henkan-ki") == 0 then
		doTeleportThing(cid, fromPosition, false)
		MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_INFO_DESCR,
			"Reishi Henkan-Ki is not enabled. Talk to Urahara to enable it.",
			"Reishi Henkan-Ki não está ativo. Converse com o Urahara para ativá-lo."
		)
		return true
	end

	doCreatureSetStorage(cid, "reishi_henkan-ki", nil)

	doTeleportThing(cid, { x = 2404, y = 3418, z = 7 })
	doSendMagicEffect({ x = 2404, y = 3418, z = 7 }, CONST_ME_TELEPORT)
	return true
end
