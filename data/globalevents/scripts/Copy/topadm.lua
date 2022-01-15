local texto = "[ADM]"
local efeito = TEXTCOLOR_RED

function onThink(interval, lastExecution)
  for _, pid in ipairs(getPlayersOnline()) do
     if getPlayerGroupId(pid) == 6 and not isPlayerGhost(pid) then
	doSendAnimatedText(getCreaturePosition(pid), texto, efeito)
     end
  end
     return true
end