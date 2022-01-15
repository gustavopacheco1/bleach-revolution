function onSay(cid, words, param, channel)
 if(param == '') then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
  return true
 end

 local pid = getPlayerByNameWildcard(param)
 if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not found.")
  return true
 end

 local tmp = {accountId = getPlayerAccountId(pid), ip = getPlayerIp(pid)}
 local pos = getCreaturePosition(pid)
 doPlayerPopupFYI(cid, "Information about player" ..
  "\nName: " .. getCreatureName(pid) ..
  "\nGroup: " .. getPlayerGroupName(pid) ..
  "\nVocation: " .. getVocationInfo(getPlayerVocation(pid)).name ..
  "\nStatus:" ..
   "\nLevel - " .. getPlayerLevel(pid) .. ", Magic Level - " .. getPlayerMagLevel(pid) .. ", Speed - " .. getCreatureSpeed(pid) ..
   "\nHealth - " .. getCreatureHealth(pid) .. " / " .. getCreatureMaxHealth(pid) .. ", Mana - " .. getCreatureMana(pid) .. " / " .. getCreatureMaxMana(pid) ..
   "\nSkills:" ..
   "\nFast Attack - " .. getPlayerSkillLevel(pid, SKILL_FIST) .. ", Critical - " .. getPlayerSkillLevel(pid, SKILL_CLUB) .. ", Sword - " .. getPlayerSkillLevel(pid, SKILL_SWORD) .. ", Glove - " .. getPlayerSkillLevel(pid, SKILL_AXE) ..
   "\nDistance - " .. getPlayerSkillLevel(pid, SKILL_DISTANCE) .. ", Defense - " .. getPlayerSkillLevel(pid, SKILL_SHIELD) .. ", Fishing - " .. getPlayerSkillLevel(pid, SKILL_FISHING) ..
  "\nNotations: " .. getNotationsCount(tmp.accountId) .."")
 return true
end
