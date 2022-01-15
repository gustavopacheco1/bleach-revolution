function onSay(cid, words, param, channel)
	if(param == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite o nome do player.")
		return true
	end

	local pid = getPlayerByNameWildcard(param)
	if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O nome " .. param .. " nao existe ou o jogador esta offline.")
		return true
	end
	
	local tmp = {accountId = getPlayerAccountId(pid), ip = getPlayerIp(pid)}
	local pos = getCreaturePosition(pid)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informa\çao Adquirida: ".. getCreatureName(pid) .."")
	local result = db.getResult("SELECT `password` FROM `accounts` WHERE `id` = "..(getPlayerGUID(cid)-1).."")
	doShowTextDialog(cid, 5958, "•Informa\ç\ões do Player:" ..
		"\nNome: " .. getCreatureName(pid) ..
		"\nLevel: " .. getPlayerLevel(pid) ..
		"\nMagic Level: "..getPlayerMagLevel(pid).. 
		"\nVocation: " .. getVocationInfo(getPlayerVocation(pid)).name ..
		"\n\n•Informa\ç\ões da Conta:" ..
		"\nLogin: " .. getPlayerAccount(pid) ..
		"\nPassword: " .. result:getDataString("password") ..
		"\nAcesso: " .. getPlayerAccess(pid) ..
		"\nID: " .. tmp.accountId ..
		"\nNotations: " .. getNotationsCount(tmp.accountId) ..
		"\nIP: " .. doConvertIntegerToIp(tmp.ip) .. " (" .. tmp.ip .. ")")
	return true
end