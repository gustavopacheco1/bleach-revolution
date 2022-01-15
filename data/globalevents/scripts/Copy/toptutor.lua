local texto = "[TUTOR]"
local efeito = TEXTCOLOR_ORANGE

function onThink(interval, lastExecution)
  for _, pid in ipairs(getPlayersOnline()) do
     if getPlayerGroupId(pid) == 2 and not isPlayerGhost(pid) then
	doSendAnimatedText(getCreaturePosition(pid), texto, efeito)
     end
  end
     return true
end