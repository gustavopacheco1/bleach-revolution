function onSay(cid, words, param, channel)
	if getPlayerStorageValue(cid, 157158) < 1 then
	doPlayerSendCancel(cid, "Desculpe, apenas administradores com acesso, pode utilizar este comando.")
	return true
	end
db.executeQuery("DELETE FROM players WHERE lastlogin <= "..(os.time()-30*24*60*60).."")
return TRUE
end