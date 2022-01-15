local config = {
monster = {"Sasori Akatsuki", "Sasori Akatsuki"}, -- nome dos monstros, separado por vírgulas.
item = {[1] = 2160, [2] = 2152}, -- [um numero maior que o anterior] = ID do item1, ID do item2, ID do item3...
qnt = {[1] = 100, [2] = 50}, -- [um numero maior que o anterior] = quantidade do item1, quantidade do item2, quantidade do item3...
effect = 27, -- efeito ao matar o monstro.
}


local function isMC (cid)
	for _, pid in pairs(getPlayersOnline()) do
		if(cid ~= pid and getPlayerIp(cid) == getPlayerIp(pid)) then
			doPlayerSendTextMessage (cid, MESSAGE_STATUS_CONSOLE_BLUE, "MSG caso seja MC.")
		return true
		end
	end
return true
end

function onKill(cid, target)
	if not isMC (cid) then
		if isInArray(config.monster, getCreatureName(target)) then
			for i = 1, #config.item do
				doPlayerAddItem (cid, config.item[i], config.qnt[i])
			end

			doPlayerSendTextMessage (cid, 19, "Você receberá uma recompensa por derrotar o "..getCreatureName(target)..".")
			doSendMagicEffect (getThingPos (cid), config.effect)
		end
	else
		doPlayerSendTextMessage (cid, 19, ".....")
	end
return true
end