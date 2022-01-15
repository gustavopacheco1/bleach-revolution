function onSay(cid, words, param, channel)
	if getPlayerStorageValue(cid, 157158) < 1 then
	doPlayerSendCancel(cid, "Desculpe, apenas administradores com acesso, pode utilizar este comando.")
	return true
	end
local config = {
storage = 102590,
}
if(param == 'cancel') then
if getGlobalStorageValue(config.storage) > 0 then
setGlobalStorageValue(config.storage, -1)
doBroadcastMessage("Double Exp cancelado")
end
return true
end
	
param = tonumber(param)
if(not param or param < 0) then
doPlayerSendCancel(cid, "Digite por quantas horas o evento ira durar")
return true
end
if getGlobalStorageValue(config.storage) - os.time() <= 0 then
setGlobalStorageValue(config.storage, os.time()+param*60*60)
doBroadcastMessage("Exp bonus ativado 50% + EXP  por "..param.." horas! Aproveite.")
end
return true
end
