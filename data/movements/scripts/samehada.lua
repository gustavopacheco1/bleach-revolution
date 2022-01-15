function onEquip(cid, item, slot)
if isInArray( 23, getPlayerVocation(cid)) then
local outfit = {lookType = 456}
doSetCreatureOutfit(cid, outfit)
return true
end
end

function onDeEquip(cid, item, slot)
doRemoveCondition(cid, CONDITION_OUTFIT)
doSendMagicEffect(getPlayerPosition(cid), 1) -- effect
return true
end