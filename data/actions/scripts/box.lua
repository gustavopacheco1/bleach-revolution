local config = {
    premiumDays = 1,
    storageQuest = 19354,
    timeWait = 5, -- tempo em minutos
}

function onUse(cid, item, frompos, item2, topos)

		if isInArray( 24, getPlayerVocation(cid)) and (getPlayerStorageValue(cid, config.storageQuest) < os.time()) then
        setPlayerStorageValue(cid, config.storageQuest, os.time() + (config.timeWait * 60))
		local pos1 = getThingPos(cid)
		doSendMagicEffect({x = pos1.x + 1, y = pos1.y + 1, z = pos1.z}, 11)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce acaba, de ativar a passiva da Imortalidade, mas tome cuidado, pois a mesma so sera valida, apos 5 minutos.")
		doSendAnimatedText(getPlayerPosition(cid),"l- IMoRTaLiTY -l", math.random(1,69))
		doCreatureSay(cid, "- IMoRTaLiTY -", TALKTYPE_MONSTER)
        doRemoveItem(item.uid, 1)
		elseif isInArray( 24, getPlayerVocation(cid)) then
		doPlayerSendCancel(cid, "Voce deve esperar "..config.timeWait.." minutos, para utilizar o amuleto novamente.")
	    return true
end
	
	if isInArray(getPlayerVocation(cid)) ~= 24 then
	doPlayerSendCancel(cid, "Somente o Hidan, pode fazer uso de seu amuleto.")
    return true
end
end