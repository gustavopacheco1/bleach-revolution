function onSay(cid, words, param, channel) 
    if (param == "") then
	    return doPlayerSendTextMessage(cid, 27, "\n-on\n-off")
		
    elseif (param == "on") then
        if getGlobalStorageValue(9999) < 0 then
            doPlayerSendTextMessage(cid, 27, "ANTI MC ja esta ligado.")
        else
            setGlobalStorageValue(9999, -1)
			doPlayerSendTextMessage(cid, 27, "ANTI MC foi ligado.")
        end
		
    elseif (param == "off") then
        if getGlobalStorageValue(9999) > 0 then
            doPlayerSendTextMessage(cid, 27, "ANTI MC ja esta desligado.")
        else
            setGlobalStorageValue(9999, 1)
			doPlayerSendTextMessage(cid, 27, "ANTI MC foi desligado.")
        end
	end
    return true  
end