local look = 257 -- Coloque o ID do outfit

function onEquip(cid, item)
    doSetCreatureOutfit(cid, {lookType = look}, -1)
return true
end

function onDeEquip(cid, item)
    doRemoveCondition(cid, CONDITION_OUTFIT)
return true
end