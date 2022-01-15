function onSay(cid, words, param, channel) 
local ccc = getGlobalStorageValue(WAR_Lib_Config.TeamTobi.storage)
doPlayerSendTextMessage(cid, 27, ""..ccc.."")
return TRUE
end