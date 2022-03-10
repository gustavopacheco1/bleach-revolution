function onTarget(cid, target)
    if isNpc(target) then
        if getDistanceBetween(getCreaturePosition(cid), getCreaturePosition(target)) < 5 then
            doCreatureSay(cid, "hi", 10)
            doCreatureSay(cid, "trade", 10)
        end
    end
    return true
end
