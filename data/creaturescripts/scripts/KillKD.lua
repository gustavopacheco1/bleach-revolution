function onKill(cid, target)
 
    if(isMonster(target)) then
        updateK(cid)
        updateD(target)
    end
 
    return true
end