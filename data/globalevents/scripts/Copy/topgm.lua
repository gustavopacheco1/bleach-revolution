local texto = "[GM]"
local efeito = TEXTCOLOR_GREEN

function onThink(interval, lastExecution)
  for _, pid in ipairs(getPlayersOnline()) do
     if getPlayerGroupId(pid) == 4 and not isPlayerGhost(pid) then
	doSendAnimatedText(getCreaturePosition(pid), texto, efeito)
     end
  end
     return true
end