function onKill(cid, target)
if isPlayer(cid) and isMonster(target) then
if getGlobalStorageValue(102590) - os.time() >= 1 then
local exp = getExperienceStage(getPlayerLevel(cid), getVocationInfo(getPlayerVocation(cid)).experienceMultiplier)
local count = ((getMonsterInfo(string.lower(getCreatureName(target))).experience*1.5*exp)/2)
doPlayerAddExperience(cid, count)
addEvent(doSendAnimatedText, 500, getCreaturePosition(cid), '+'..count, math.random(50,60))
end
else
return TRUE
end
return TRUE
end