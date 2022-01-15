local kisame_lyze = createConditionObject(CONDITION_PARALYZE)
setConditionParam(kisame_lyze, CONDITION_PARAM_TICKS, 5000)
setConditionFormula(kisame_lyze, -0.5, 0, -0.5, 0)

function onCastSpell(cid, var)

if exhaustion.check(cid, 13302) == TRUE then
if exhaustion.get(cid, 13302) >= 120 then
doPlayerSendCancel(cid, "Suiton Suirou cooldown " ..math.floor(exhaustion.get(cid, 13302)/60).." minutos.")
return false
end
if exhaustion.get(cid, 13302) > 60 then
doPlayerSendCancel(cid, "Suiton Suirou cooldown 1 minuto and " ..(exhaustion.get(cid, 13302)-60).." segundos.")
return false
end
doPlayerSendCancel(cid, "Suiton Suirou cooldown " ..exhaustion.get(cid, 13302).." segundos.")
return false
end

if not isSightClear(getCreaturePos(cid), getCreaturePos(getCreatureTarget(cid)), 1) then
return false
end

doAddCondition(getCreatureTarget(cid), kisame_lyze)
doSendMagicEffect({x = getCreaturePos(getCreatureTarget(cid)).x, y = getCreaturePos(getCreatureTarget(cid)).y, z = getCreaturePos(getCreatureTarget(cid)).z}, 502)

exhaustion.set(cid, 13302, 29.0)

return true
end