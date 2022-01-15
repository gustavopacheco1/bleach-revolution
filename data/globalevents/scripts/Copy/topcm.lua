local texto = "[CM]"
local efeito = TEXTCOLOR_YELLOW

function onThink(interval, lastExecution)
  for _, pid in ipairs(getPlayersOnline()) do
     if getPlayerGroupId(pid) == 5 and not isPlayerGhost(pid) then
	doSendAnimatedText(getCreaturePosition(pid), texto, efeito)
     end
  end
     return true
end