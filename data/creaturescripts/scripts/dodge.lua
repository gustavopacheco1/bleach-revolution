 function onTarget(cid, target)
  if isMonster(cid) and isPlayer(target) and isInArray( 1, getPlayerVocation(cid)) then
  return false
  end
  return true
end