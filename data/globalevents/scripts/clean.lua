function executeClean()
	doCleanMap()
	doBroadcastMessage("[CLEAN AUTOMATIC] O mapa, foi limpo, proxixa limpeza em 2 horas..")
	return true
end

function onThink(interval)
	doBroadcastMessage("[CLEAN AUTOMATIC] O mapa sera limpo em 30 segundos, retire do chão os seus itens!")
	addEvent(executeClean, 30000)
	return true
end
