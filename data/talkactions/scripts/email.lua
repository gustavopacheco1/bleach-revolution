EMAIL_BLOCK = 6364
EMAIL_ANTI_SPAWN = 15
EMAIL_MIN_MENSSAGE = 10
EMAIL_MAX_MENSSAGE = 100
EMAIL_STORAGE_ANTI_SPAWN = 6365

function onSay(cid, words, param)

if words == "!sendemail" then

if(param == "") then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param. Please use: !sendemail name, menssage")
return TRUE
end

local t = string.explode(param, ",")
if(not t[2]) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "No menssage specified.")
return TRUE
end

if (getPlayerGUIDByName(t[1]) == 0) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. t[1] .. " not exist.")
return TRUE
end

if (string.len(t[2]) <= EMAIL_MIN_MENSSAGE) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry you can't send this menssage, because so short.")
return TRUE
end

if (string.len(t[2]) > EMAIL_MAX_MENSSAGE) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry you can't send this menssage, because so long.")
return TRUE
end

local directory = "data//email//".. t[1] ..".txt"

if onFile("exist", directory) == FALSE then

onFile("create", directory, "BY: ".. getCreatureName(cid) .." [" .. os.date("%d/%m/%Y %H:%M:%S") .. "] ".. t[2] .."\n")
doPlayerSendTextMessage(cid, 22, "You have send to ".. t[1] .." this menssage: " .. t[2] .. ".")
exhaustion.make(cid, EMAIL_STORAGE_ANTI_SPAWN, EMAIL_ANTI_SPAWN)

else

onFile("update", directory, "BY: ".. getCreatureName(cid) .." [" .. os.date("%d/%m/%Y %H:%M:%S") .. "] ".. t[2] .."")
doPlayerSendTextMessage(cid, 22, "You have send to ".. t[1] .." this menssage: " .. t[2] .. "")
exhaustion.make(cid, EMAIL_STORAGE_ANTI_SPAWN, EMAIL_ANTI_SPAWN) 
end

local target = getPlayerByNameWildcard(""..t[1].."")
if(target == 0) then
target = getCreatureByName(""..t[1].."")
if(target == 0) then
return TRUE
end
end

local tmp = getCreaturePosition(target)
if (isOnline(""..t[1].."") == TRUE) then
addEvent(doSendAnimatedText, 1, tmp, "Menssage!", TEXTCOLOR_PURPLE)
addEvent(doSendAnimatedText, 1000, tmp, "Menssage!", TEXTCOLOR_PURPLE)
addEvent(doSendAnimatedText, 2000, tmp, "Menssage!", TEXTCOLOR_PURPLE)
doPlayerSendTextMessage(target, 19, " A new menssage arrived, look your email box. (!checkemail)!!")
end


elseif words == "!checkemail" then
local name = getCreatureName(cid)
local directory = "data//email//".. name ..".txt"

if onFile("exist", directory) == FALSE or onFile("load", directory) == nil then
doPlayerSendTextMessage(cid, 22, "Sorry you don't have any menssage.")
else

for line in io.lines(directory) do
doShowTextDialog(cid,7528, "You have menssages: \n \n ".. line .." \n \n \n For look the next menssage click in the button: OK")

end
end

elseif words == "!deleteemail" then
local name = getCreatureName(cid)
local directory = "data//email//".. name ..".txt"

if onFile("exist", directory) == TRUE and onFile("load", directory) ~= nil then
onFile("delete", directory)
onFile("erase", directory)
doPlayerSendTextMessage(cid, 22, "Sucessful!! You have deleted all yours menssages !!")
else
doPlayerSendTextMessage(cid, 22, "Sorry you don't have any menssage to delete.")
end


elseif words == "!blockemail" then
setPlayerStorageValue(cid, EMAIL_BLOCK, 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You has been bloked your e-mail. Please relog to make effect.")


elseif words == "!unblockemail" then
setPlayerStorageValue(cid, EMAIL_BLOCK, 0)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You has been unbloked your e-mail. Please relog to make effect.")

end

end