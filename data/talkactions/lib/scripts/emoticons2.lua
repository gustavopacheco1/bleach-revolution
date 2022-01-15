function onSay(cid, words, param, channel)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Coloca un espacio entre ! y el codigo del emoticon [Ejemplo: ! :D].")
return true
end
if param == ":D" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 43)
end

elseif param == ":|" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 44)
end

elseif param == "o.o" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 45)
end

elseif param == "^^" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 46)
end

elseif param == ":O" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 47)
end

elseif param == "¬¬" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 48)
end

elseif param == "u.u" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 49)
end

elseif param == ":$" then
if isPlayer(cid) == TRUE then
doSendMagicEffect(getCreaturePosition(cid), 50)
end

stopEvent(say_events[getPlayerGUID(cid)])
say_events[getPlayerGUID(cid)] = nil

end
return TRUE
end