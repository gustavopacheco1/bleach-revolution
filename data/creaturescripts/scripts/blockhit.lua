function onAttack(cid, target, attacker, type, combat, value)

if isPlayer(target) and #getCreatureSummons(target) >= 1 then
doMonsterSetTarget(cid, getCreatureSummons(target)[1])
end

return true
end